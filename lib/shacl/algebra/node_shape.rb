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

      # Add some instance options to the argument
      options = %i{
        flags
        qualifiedMinCount
        qualifiedMaxCount
        qualifiedValueShapesDisjoint
      }.inject(options) do |memo, sym|
        @options[sym] ? memo.merge(sym => @options[sym]) : memo
      end

      # Evaluate against builtins
      builtin_results = @options.map do |k, v|
        self.send("builtin_#{k}".to_sym, v, node, nil, [node], depth: depth + 1, **options) if self.respond_to?("builtin_#{k}".to_sym)
      end.flatten.compact

      # Evaluate against operands
      op_results = operands.map do |op|
        res = op.conforms(node,
          focus: options.fetch(:focusNode, node),
          depth: depth + 1,
          **options)
        if op.is_a?(NodeShape) && !res.all?(&:conform?)
          # Special case for embedded NodeShape
          not_satisfied(focus: node,
            value: node,
            message: "node does not conform to #{op.id}",
            component: RDF::Vocab::SHACL.NodeConstraintComponent,
            **options)
        else
          res
        end
      end.flatten.compact

      builtin_results + op_results
    end
  end
end
