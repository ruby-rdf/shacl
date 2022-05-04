require_relative "shape"
require 'sparql'

module SHACL::Algebra
  ##
  class SPARQLConstraint < Operator
    NAME = :sparql

    # Validates the specified `property` within `graph`, a list of {ValidationResult}.
    #
    # A property conforms the nodes found by evaluating it's `path` all conform.
    #
    # Last operand is the parsed query. Bound variables are added as a table entry joined to the query.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    #   Returns a validation result for each value node.
    def conforms(node, depth: 0, **options)
      return [] if deactivated?
      options = {severity: RDF::Vocab::SHACL.Violation}.merge(options)
      log_debug(NAME, depth: depth) {SXP::Generator.string({id: id, node: node}.to_sxp_bin)}

      bindings = RDF::Query::Solution.new({
        this: [node]
      })
      solutions = operands.last.execute(graph, bindings: bindings, depth: depth + 1, **options)
      if solutions.empty?
        satisfy(focus: node,
          message: "node conforms to SPARQL shape",
          component: RDF::Vocab::SHACL.SPARQLConstraintComponent,
          depth: depth, **options)
      else
        solutions.map do |solution|
          not_satisfied(focus: node, path: solution[:path],
            value: (solution[:value] || node),
            message: @options.fetch(:message, "node does not coform to SPARQL component"),
            resultSeverity: options.fetch(:severity),
            component: RDF::Vocab::SHACL.SPARQLConstraintComponent,
            depth: depth, **options)
        end
      end
    end

    # All keys associated with shapes which are set in options
    #
    # @return [Array<Symbol>]
    ALL_KEYS = %i(
      type label name comment description deactivated severity
      message path
      ask select
      declare namespace prefix prefixes select ask
    ).freeze

    ##
    # Creates an operator instance from a parsed SHACL representation.
    #
    # Special case for SPARQLComponenet due to general recursion.
    #
    # @param [Hash] operator
    # @param [Hash] options ({})
    # @option options [Hash{String => RDF::URI}] :prefixes
    # @return [Operator]
    def self.from_json(operator, **options)
      prefixes, query = [], ""
      operands = []
      node_opts = options.dup
      operator.each do |k, v|
        next if v.nil?
        case k
        # List properties
        when 'path'               then node_opts[:path] = parse_path(v, **options)
        when 'prefixes'
          prefixes = extract_prefixes(v)
        when 'severity'           then node_opts[:severity] = iri(v, **options)
        when 'type'               then node_opts[:type] = as_array(v).map {|vv| iri(vv, **options)} if v
        else
          node_opts[k.to_sym] = to_rdf(k.to_sym, v, **options) if ALL_KEYS.include?(k.to_sym)
        end
      end

      query_string = prefixes.join("\n") + node_opts[:select] || node_opts[:ask]
      operands << SPARQL.parse(query_string)
      new(*operands, **node_opts)
    end

  private
  
    # Returns an array of prefix definitions
    def self.extract_prefixes(value)
      case value
      when Hash
        ret = []
        # Recursively extract decllarations
        extract_prefixes(value.fetch('imports', nil)) +
        as_array(value.fetch('declare', [])).map do |decl|
          pfx, ns = decl['prefix'], decl['namespace']
          "PREFIX #{pfx}: <#{ns}>"
        end
      when Array then value.map {|v| extract_prefixes(v)}.flatten
      else []
      end
    end
  end
end
