require 'sparql/algebra'
require 'shacl/validation_result'
require 'json/ld'
require_relative 'property_path'

module SHACL::Algebra

  ##
  # The SHACL operator.
  #
  # @abstract
  class Operator < SPARQL::Algebra::Operator
    include RDF::Util::Logger
    extend SHACL::Algebra::PropertyPath
    extend JSON::LD::Utils

    # All keys associated with shapes which are set in options
    #
    # @return [Array<Symbol>]
    ALL_KEYS = %w(
      id type label name comment description deactivated
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

    ##
    # Creates an operator instance from a parsed SHACL representation
    # @param [Hash] operator
    # @param [Hash] options ({})
    # @option options [Hash{String => RDF::URI}] :prefixes
    # @return [Operator]
    def self.from_json(operator, **options)
      operands = []
      node_opts = options.dup
      operator.each do |k, v|
        next if v.nil?
        case k
        # List properties
        when 'and'
          elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
          operands << And.new(*elements, **options.dup)
        when 'class'              then node_opts[:class] = iri(v, **options)
        when 'datatype'           then node_opts[:datatype] = iri(v, **options)
        when 'disjoint'           then node_opts[:disjoint] = iri(v, **options)
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
        when 'path'               then node_opts[:path] = parse_path(v)
        when 'property'
          operands.push(*as_array(v).map {|vv| PropertyShape.from_json(vv, **options)})
        when 'qualifiedValueShape'
          elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
          operands << QualifiedValueShape.new(*elements, **options.dup)
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
          node_opts[k.to_sym] = v if ALL_KEYS.include?(k.to_sym)
        end
      end

      new(*operands, **node_opts)
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
    def deactivated?; !!@options[:deactivated]; end

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

    # Create URIs
    # @param  (see #iri)
    # @option (see #iri)
    # @return (see #iri)
    def self.iri(value, base: RDF::Vocab::SHACL.to_uri, vocab: true, **options)
      # Context will have been pre-loaded
      @context ||= JSON::LD::Context.parse("http://github.com/ruby-rdf/shacl/")

      value = value['id'] || value['@id'] if value.is_a?(Hash)
      result = RDF::URI(@context.expand_iri(value, base: base, vocab: vocab))
      if result.respond_to?(:qname) && result.qname
        result = RDF::URI.new(result.to_s) if result.frozen?
        result.lexical = result.qname.join(':')
      end
      result
    end

    # Interpret a JSON-LD expanded value
    # @param [Hash] item
    # @return [RDF::Term]
    def self.from_expanded_value(item, **options)
      if item['@value']
        value, datatype = item.fetch('@value'), item.fetch('@type', nil)
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
        datatype = RDF::URI(datatype) if datatype && !datatype.is_a?(RDF::URI)
        language = item.fetch('@language', nil) if datatype == RDF.langString
        RDF::Literal.new(value, datatype: datatype, language: language)
      elsif item['id']
        self.iri(item['id'], **options)
      else
        RDF::Node.new
      end
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
    # @param [RDF::URI] severity (RDF:::Vocab::SHACL.Info)
    # @param [Array<RDF::URI>] path
    # @param [RDF::Term] value
    # @param [RDF::Term] details
    # @param [String] message
    # @return [Array<SHACL::ValidationResult>]
    def satisfy(focus:, shape:, component:, severity: RDF::Vocab::SHACL.Info, path: nil, value: nil, details: nil, message: nil, **options)
      log_debug(self.class.const_get(:NAME), "satisfied#{': ' + message if message}", **options)
      [SHACL::ValidationResult.new(focus, path, shape, severity, component,
                                   details, value, message)]
    end

    ##
    # Create a result that does not satisfies the shape.
    #
    # @param [RDF::Term] focus
    # @param [RDF::Resource] shape
    # @param [RDF::URI] component
    # @param [RDF::URI] severity (RDF:::Vocab::SHACL.Violation)
    # @param [Array<RDF::URI>] path
    # @param [RDF::Term] value
    # @param [RDF::Term] details
    # @param [String] message
    # @return [Array<SHACL::ValidationResult>]
    def not_satisfied(focus:, shape:, component:, severity: RDF::Vocab::SHACL.Violation, path: nil, value: nil, details: nil, message: nil, **options)
      log_info(self.class.const_get(:NAME), "not satisfied#{': ' + message if message}", **options)
      [SHACL::ValidationResult.new(focus, path, shape, severity, component,
                                   details, value, message)]
    end
  end
end
