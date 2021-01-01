require 'sparql/algebra'
require 'shacl/validation_result'
require 'json/ld'

module SHACL::Algebra

  ##
  # The SHACL operator.
  #
  # @abstract
  class Operator < SPARQL::Algebra::Operator
    include RDF::Util::Logger
    extend JSON::LD::Utils

    # All keys associated with shapes which are set in options
    #
    # @return [Array<Symbol>]
    ALL_KEYS = %w(
      id type label name comment description deactivated severity
      order group defaultValue path
      targetNode targetClass targetSubjectsOf targetObjectsOf
      class datatype nodeKind
      minCount maxCount
      minExclusive minInclusive maxExclusive maxInclusive
      minLength maxLength
      pattern flags languageIn uniqueLang
      qualifiedValueShapesDisjoint qualifiedMinCount qualifiedMaxCount
      equals disjoint lessThan lessThanOrEquals
      closed ignoredProperties hasValue in
    ).map(&:to_sym).freeze

    # Initialization options
    attr_accessor :options

    # Graph against which shapes are validaed
    attr_accessor :graph

    ## Class methods
    class << self
      ##
      # Creates an operator instance from a parsed SHACL representation
      # @param [Hash] operator
      # @param [Hash] options ({})
      # @option options [Hash{String => RDF::URI}] :prefixes
      # @return [Operator]
      def from_json(operator, **options)
        operands = []
        node_opts = options.dup
        operator.each do |k, v|
          next if v.nil?
          case k
          # List properties
          when 'and'
            elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
            operands << And.new(*elements, **options.dup)
          when 'class'              then node_opts[:class] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'datatype'           then node_opts[:datatype] = iri(v, **options)
          when 'disjoint'           then node_opts[:disjoint] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'equals'             then node_opts[:equals] = iri(v, **options)
          when 'id'                 then node_opts[:id] = iri(v, vocab: false, **options)
          when 'ignoredProperties'  then node_opts[:ignoredPropertiese] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'lessThan'           then node_opts[:lessThan] = iri(v, **options)
          when 'lessThanOrEquals'   then node_opts[:lessThanOrEquals] = iri(v, **options)
          when 'node'
            operands.push(*as_array(v).map {|vv| NodeShape.from_json(vv, **options)})
          when 'nodeKind'           then node_opts[:nodeKind] = iri(v, **options)
          when 'not'
            elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
            operands << Not.new(*elements, **options.dup)
          when 'or'
            elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
            operands << Or.new(*elements, **options.dup)
          when 'path'               then node_opts[:path] = parse_path(v, **options)
          when 'property'
            operands.push(*as_array(v).map {|vv| PropertyShape.from_json(vv, **options)})
          when 'qualifiedValueShape'
            elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
            operands << QualifiedValueShape.new(*elements, **options.dup)
          when 'severity'           then node_opts[:severity] = iri(v, **options)
          when 'targetClass'        then node_opts[:targetClass] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'targetNode'
            node_opts[:targetNode] = as_array(v).map do |vv|
              from_expanded_value(vv, **options)
            end if v
          when 'targetObjectsOf'    then node_opts[:targetObjectsOf] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'targetSubjectsOf'   then node_opts[:targetSubjectsOf] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'type'               then node_opts[:type] = as_array(v).map {|vv| iri(vv, **options)} if v
          when 'xone'
            elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
            operands << Xone.new(*elements, **options.dup)
          else
            # Add as a plain option if it is recognized
            node_opts[k.to_sym] = to_rdf(k.to_sym, v, **options) if ALL_KEYS.include?(k.to_sym)
          end
        end

        new(*operands, **node_opts)
      end

      # Create URIs
      # @param  (see #iri)
      # @option (see #iri)
      # @return (see #iri)
      def iri(value, base: RDF::Vocab::SHACL.to_uri, vocab: true, **options)
        # Context will have been pre-loaded
        @context ||= JSON::LD::Context.parse("http://github.com/ruby-rdf/shacl/")

        value = value['id'] || value['@id'] if value.is_a?(Hash)
        result = @context.expand_iri(value, base: base, vocab: vocab)
        result = RDF::URI(result) if result.is_a?(String)
        if result.respond_to?(:qname) && result.qname
          result = RDF::URI.new(result.to_s) if result.frozen?
          result.lexical = result.qname.join(':')
        end
        result
      end

      # Turn a JSON-LD value into its RDF representation
      # @see JSON::LD::ToRDF.item_to_rdf
      # @param [Symbol] term
      # @param [Object] item
      # @return RDF::Term
      def to_rdf(term, item, **options)
        @context ||= JSON::LD::Context.parse("http://github.com/ruby-rdf/shacl/")

        return item.map {|v| to_rdf(term, v, **options)} if item.is_a?(Array)

        case
        when item.is_a?(TrueClass) || item.is_a?(FalseClass) || item.is_a?(Numeric)
          return RDF::Literal(item)
        when value?(item)
          value, datatype = item.fetch('@value'), item.fetch('type', nil)
          case value
          when TrueClass, FalseClass, Numeric
            return RDF::Literal(value)
          else
            datatype ||= item.has_key?('@direction') ?
              RDF::URI("https://www.w3.org/ns/i18n##{item.fetch('@language', '').downcase}_#{item['@direction']}") :
              (item.has_key?('@language') ? RDF.langString : RDF::XSD.string)
          end
          datatype = iri(datatype) if datatype
                  
          # Initialize literal as an RDF literal using value and datatype. If element has the key @language and datatype is xsd:string, then add the value associated with the @language key as the language of the object.
          language = item.fetch('@language', nil) if datatype == RDF.langString
          return RDF::Literal.new(value, datatype: datatype, language: language)
        when node?(item)
          return iri(item, **options)
        when list?(item)
          RDF::List(*item['@list'].map {|v| to_rdf(term, v, **options)})
        when item.is_a?(String)
          RDF::Literal(item)
        else
          raise "Can't transform #{item.inspect} to RDF on property #{term}"
        end
      end

      # Interpret a JSON-LD expanded value
      # @param [Hash] item
      # @return [RDF::Term]
      def from_expanded_value(item, **options)
        if item['@value']
          value, datatype = item.fetch('@value'), item.fetch('type', nil)
          case value
          when TrueClass, FalseClass
            value = value.to_s
            datatype ||= RDF::XSD.boolean.to_s
          when Numeric
            # Don't serialize as double if there are no fractional bits
            as_double = value.ceil != value || value >= 1e21 || datatype == RDF::XSD.double
            lit = if as_double
              RDF::Literal::Double.new(value, canonicalize: true)
            else
              RDF::Literal.new(value.numerator, canonicalize: true)
            end

            datatype ||= lit.datatype
            value = lit.to_s.sub("E+", "E")
          else
            datatype ||= item.has_key?('@language') ? RDF.langString : RDF::XSD.string
          end
          datatype = iri(datatype) if datatype
          language = item.fetch('@language', nil) if datatype == RDF.langString
          RDF::Literal.new(value, datatype: datatype, language: language)
        elsif item['id']
          self.iri(item['id'], **options)
        else
          RDF::Node.new
        end
      end

      ##
      # Parse the "patH" attribute into a SPARQL Property Path and evaluate to find related nodes.
      #
      # @param [Object] path
      # @return [RDF::URI, SPARQL::Algebra::Expression]
      def parse_path(path, **options)
        case path
        when RDF::URI then path
        when String then iri(path)
        when Hash
          # Creates a SPARQL S-Expression resulting in a query which can be used to find corresponding
          {
            alternativePath: :alt,
            inversePath: :reverse,
            oneOrMorePath: :"path+",
            "@list": :seq,
            zeroOrMorePath: :"path*",
            zeroOrOnePath: :"path?",
          }.each do |prop, op_sym|
            if path[prop.to_s]
              value = path[prop.to_s]
              value = value['@list'] if value.is_a?(Hash) && value.key?('@list')
              value = [value] if !value.is_a?(Array)
              value = value.map {|e| parse_path(e, **options)}
              op = SPARQL::Algebra::Operator.for(op_sym)
              if value.length > op.arity
                # Divide into the first operand followed by the operator re-applied to the reamining operands
                value = value.first, apply_op(op, value[1..-1])
              end
              return op.new(*value)
            end
          end

          if path['id']
            iri(path['id'])
          else
            log_error('PropertyPath', "Can't handle path", **options) {path.to_sxp}
          end
        else
          log_error('PropertyPath', "Can't handle path", **options) {path.to_sxp}
        end
      end

      # Recursively apply operand to sucessive values until the argument count which is expected is achieved
      def apply_op(op, values)
        if values.length > op.arity
          values = values.first, apply_op(op, values[1..-1])
        end
        op.new(*values)
      end
      protected :apply_op
    end

    # The ID of this operator
    # @return [RDF::Resource]
    def id; @options[:id]; end

    # The types associated with this operator
    # @return [Array<RDF::URI>]
    def type; @options[:type]; end

    # Any label associated with this operator
    # @return [RDF::Literal]
    def label; @options[:label]; end

    # Is this shape deactivated?
    # @return [Boolean]
    def deactivated?; @options[:deactivated] == RDF::Literal::TRUE; end

    # Any comment associated with this operator
    # @return [RDF::Literal]
    def comment; @options[:comment]; end

    # Create URIs
    # @param [RDF::Value, String] value
    # @param [Boolean] vocab resolve vocabulary relative to the builtin context.
    # @param [Hash{Symbol => Object}] options
    # @return [RDF::Value]
    def iri(value, options = @options)
      self.class.iri(value, **options)
    end

    # Validates the specified `node` within `graph`, a list of {ValidationResult}.
    #
    # A node conforms if it is not deactivated and all of its operands conform.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<ValidationResult>]
    def conforms(node, depth: 0, **options)
      raise NotImplemented
    end

    def to_sxp_bin
      expressions = ALL_KEYS.inject([self.class.const_get(:NAME)]) do |memo, sym|
        @options[sym] ? memo.push([sym, *@options[sym]]) : memo
      end + operands

      expressions.to_sxp_bin
    end

    ##
    # Create a result that satisfies the shape.
    #
    # @param [RDF::Term] focus
    # @param [RDF::Resource] shape
    # @param [RDF::URI] component
    # @param [RDF::URI] resultSeverity (nil)
    # @param [Array<RDF::URI>] path (nil)
    # @param [RDF::Term] value (nil)
    # @param [RDF::Term] details (nil)
    # @param [String] message (nil)
    # @return [Array<SHACL::ValidationResult>]
    def satisfy(focus:, shape:, component:, resultSeverity: nil, path: nil, value: nil, details: nil, message: nil, **options)
      log_debug(self.class.const_get(:NAME), "#{'not ' if resultSeverity}satisfied #{value}#{': ' + message if message}", **options)
      [SHACL::ValidationResult.new(focus, path, shape, resultSeverity, component,
                                   details, value, message)]
    end

    ##
    # Create a result that does not satisfies the shape.
    #
    # @param [RDF::Term] focus
    # @param [RDF::Resource] shape
    # @param [RDF::URI] component
    # @param [RDF::URI] resultSeverity (RDF:::Vocab::SHACL.Violation)
    # @param [Array<RDF::URI>] path (nil)
    # @param [RDF::Term] value (nil)
    # @param [RDF::Term] details (nil)
    # @param [String] message (nil)
    # @return [Array<SHACL::ValidationResult>]
    def not_satisfied(focus:, shape:, component:, resultSeverity: RDF::Vocab::SHACL.Violation, path: nil, value: nil, details: nil, message: nil, **options)
      log_info(self.class.const_get(:NAME), "not satisfied #{value}#{': ' + message if message}", **options)
      [SHACL::ValidationResult.new(focus, path, shape, resultSeverity, component,
                                   details, value, message)]
    end
  end
end
