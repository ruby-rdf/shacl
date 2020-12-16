require_relative "shape"

module SHACL::Algebra
  ##
  class NodeShape < SHACL::Algebra::Shape
    NAME = :NodeShape

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
      log_debug(NAME, depth: depth) {SXP::Generator.string({id: id, node: node}.to_sxp_bin)}

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
