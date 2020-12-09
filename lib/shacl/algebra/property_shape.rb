require_relative "shape"

module SHACL::Algebra
  ##
  class PropertyShape < Shape
    NAME = :PropertyShape

    # Validates the specified `property` within `graph`, a list of {ValidationResult}.
    #
    # A property conforms the nodes found by evaluating it's `path` all conform.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    #   Returns a validation result for each value node.
    def conforms(node, depth: 0, **options)
      return [] if deactivated?
      options = id ? options.merge(shape: id) : options
      path = parse_path(@options[:path])
      log_debug(NAME, depth: depth) {{id: id, path: path}.to_sxp}

      # Turn the `path` attribute into a SPARQL Property Path and evaluate to find related nodes.
      if path.uri?
        value_nodes = graph.query(subject: node, predicate: path).objects

        # Evaluate against builtins
        builtin_results = @options.map do |k, v|
          self.send("builtin_#{k}".to_sym, v, node, path, value_nodes, depth: depth + 1, **options) if self.respond_to?("builtin_#{k}".to_sym)
        end.flatten.compact

        # Evaluate against operands
        op_results = operands.map do |op|
          value_nodes.map do |n|
            op.conforms(n, depth: depth + 1, **options)
          end
        end.flatten.compact

        builtin_results + op_results
      else
        log_error(NAME, "Can't handle path", depth: depth) {path.to_sxp}
      end
    end

    ##
    # Parse the "patH" attribute into a SPARQL Property Path and evaluate to find related nodes.
    #
    # @param [Object] path
    # @return [RDF::URI, SPARQL::Algebra::Expression]
    def parse_path(path)
      case path
      when String then iri(path, **@options)
      else
        log_error(NAME, "Can't handle path") {path.to_sxp}
      end
    end

    ##
    # Builin evaluators
    ##

    # Specifies the minimum number of value nodes.
    #
    # @param [Integer] count
    # @param [Array<RDF::Term>] value_nodes
    # @return [Array<SHACL::ValidationResult>]
    def builtin_minCount(count, node, path, value_nodes, **options)
      satisfy(focus: node, path: path,
        message: "minWidth #{value_nodes.count} >= #{count}",
        severity: (value_nodes.count >= count.to_i ? RDF::Vocab::SHACL.Info : RDF::Vocab::SHACL.Violation),
        component: RDF::Vocab::SHACL.MinCountConstraintComponent,
        **options)
    end
  end
end
