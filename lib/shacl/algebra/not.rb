module SHACL::Algebra
  ##
  class Not < Operator
    NAME = :not

    ##
    # Specifies the condition that each value node cannot conform to a given shape. This is comparable to negation and the logical "not" operator.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, depth: 0, **options)
      log_debug(NAME, depth: depth)
      operands.each do |op|
        results = op.conforms(node, depth: depth + 1, **options)
        if results.any?(&:conform?)
          return not_satisfied(
            focus: node,
            message: "node does not conform to some shape",
            component: RDF::Vocab::SHACL.NotConstraintComponent,
            value: node, depth: depth, **options)
        end
      end
      satisfy(
        focus: node,
        message: "node conforms to all shapes",
        component: RDF::Vocab::SHACL.NotConstraintComponent,
        value: node, depth: depth, **options)
    end
  end
end
