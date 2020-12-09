module SHACL::Algebra
  ##
  class And < Operator
    NAME = :and

    ##
    # Produce a failure if any operand does not conform.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, depth: 0, **options)
      log_debug(NAME, depth: depth)
      operands.each do |op|
        results = op.conforms(node, depth: depth + 1, **options)
        if !results.all?(:conform?)
          return not_satisfied(
            component: RDF::Vocab::SHACL.AndConstraintComponent,
            value: node, depth: depth, **options)
        end
      end
      satisfy(
        component: RDF::Vocab::SHACL.AndConstraintComponent,
        value: node, depth: depth, **options)
    end
  end
end
