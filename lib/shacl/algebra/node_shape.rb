require_relative "shape"

module SHACL::Algebra
  ##
  class NodeShape < SHACL::Algebra::Shape
    NAME = :NodeShape

    ##
    # Returns the nodes matching this particular shape, based upon the shape properties:
    #  * `targetNode`
    #  * `targetClass`
    #  * `targetSubjectsOf`
    #  * `targetObjectsOf`
    #  * `id` – where `type` includes `rdfs:Class`
    #
    # @param [RDF::Queryable] graph    
    # @return [RDF::Resource]
    def targetNodes
      (Array(@options[:targetNode]) +
      Array(@options[:targetClass]).map do |cls|
        graph.query(predicate: RDF.type, object: cls).objects
      end +
      Array(@options[:targetSubjectsOf]).map do |cls|
        graph.query(predicate: pred).subjects
      end +
      Array(@options[:targetObjectsOf]).map do |cls|
        graph.query(predicate: pred).objects
      end + (
        Array(type).include?(RDF::RDFS.Class) ?
          graph.query(predicate: RDF.type, object: id).subjects :
          []
      )).flatten
    end

    # Validates the specified `node` within `graph`, a list of {ValidationResult}.
    #
    # A node conforms if it is not deactivated and all of its operands conform.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    #   Returns one or more validation results for each operand.
    def conforms(node, depth: 0, **options)
      return [] if deactivated?
      options = id ? options.merge(shape: id) : options
      log_debug(NAME, depth: depth) {{id: id}.to_sxp}

      # Evaluate against builtins
      builtin_results = @options.map do |k, v|
        self.send("builtin_#{k}".to_sym, v, node, nil, [node], depth: depth + 1, **options) if self.respond_to?("builtin_#{k}".to_sym)
      end.flatten.compact

      # Evaluate against operands
      op_results = operands.map do |op|
        op.conforms(node,
          focus: options.fetch(:focusNode, node),
          depth: depth + 1,
          **options)
      end.flatten.compact

      builtin_results + op_results
    end
  end
end
