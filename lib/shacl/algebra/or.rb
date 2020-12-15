module SHACL::Algebra
  ##
  class Or < Operator
    NAME = :or

    ##
    # Specifies the condition that each value node conforms to at least one of the provided shapes. This is comparable to disjunction and the logical "or" operator.
    #
    # @example
    #   ex:OrConstraintExampleShape
    #   	a sh:NodeShape ;
    #   	sh:targetNode ex:Bob ;
    #   	sh:or (
    #   		[
    #   			sh:path ex:firstName ;
    #   			sh:minCount 1 ;
    #   		]
    #   		[
    #   			sh:path ex:givenName ;
    #   			sh:minCount 1 ;
    #   		]
    #   	) .
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, depth: 0, **options)
      log_debug(NAME, depth: depth)
      operands.each do |op|
        results = op.conforms(node, depth: depth + 1, **options)
        if results.any?(&:conform?)
          return satisfy(
            focus: node,
            value: node,
            message: "node does not conform to any shape",
            component: RDF::Vocab::SHACL.OrConstraintComponent,
            depth: depth, **options)
        end
      end
      return not_satisfied(
        focus: node,
        value: node,
        message: "node conforms to some shape",
        component: RDF::Vocab::SHACL.OrConstraintComponent,
        depth: depth, **options)
    end
  end
end