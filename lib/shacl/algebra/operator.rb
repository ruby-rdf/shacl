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
      id type label name comment description deactivated
      order group defaultValue path
      targetNode targetClass targetSubjectsOf targetObjectsOf
      class datatype nodeKind
      minCount maxCount
      minExclusive minInclusive maxExclusive maxInclusive
      minLength maxLength
      pattern flags languageIn uniqueLang
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
    # @option options [RDF::URI] :base
    # @option options [Hash{String => RDF::URI}] :prefixes
    # @return [Operator]
    def self.from_json(operator, **options)
      options[:base_uri] ||= RDF::Vocab::SHACL.to_uri
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
        when 'id'                 then node_opts[:id] = iri(v, **options)
        when 'ignoredProperties'  then node_opts[:ignoredPropertiese] = as_array(v).map {|vv| iri(vv, **options)} if v
        when 'lessThan'           then node_opts[:lessThan] = iri(v, **options)
        when 'lessThanOrEquals'   then node_opts[:lessThanOrEquals] = iri(v, **options)
        when 'node'
          operands.push(*as_array(v).map {|vv| NodeShape.from_json(vv, **options)})
        when 'nodeKind'           then node_opts[:nodeKind] = iri(v, **options)
        when 'not'                then operands << Not.new(v, **options)
        when 'or'
          elements = as_array(v).map {|vv| SHACL::Algebra.from_json(vv, **options)}
          operands << Or.new(*elements, **options.dup)
        when 'property'
          operands.push(*as_array(v).map {|vv| PropertyShape.from_json(vv, **options)})
        when 'targetClass'        then node_opts[:targetClass] = as_array(v).map {|vv| iri(vv, **options)} if v
        when 'targetNode'         then node_opts[:targetNode] = as_array(v).map {|vv| iri(vv, **options)} if v
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
    # @param [Hash{Symbol => Object}] options
    # @option options [RDF::URI] :base_uri
    # @option options [Hash{String => RDF::URI}] :prefixes
    # @option options [JSON::LD::Context] :context
    # @return [RDF::Value]
    def iri(value, options = @options)
      self.class.iri(value, **options)
    end

    # Create URIs
    # @param  (see #iri)
    # @option (see #iri)
    # @return (see #iri)
    def self.iri(value, **options)
      # If we have a base URI, use that when constructing a new URI
      base_uri = options[:base_uri]

      value = value['@id'] if value.is_a?(Hash)
      if base_uri
        base_uri.join(value)
      else
        RDF::URI(value)
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
      [SHACL::ValidationResult.new(
        focus: focus,
        path: path,
        details: details,
        severity: severity,
        shape: shape,
        component: component,
        value: value,
        message: message)]
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
      [SHACL::ValidationResult.new(
        focus: focus,
        path: path,
        details: details,
        severity: severity,
        shape: shape,
        component: component,
        value: value,
        message: message)]
    end
  end
end
