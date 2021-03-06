module SHACL::Algebra
  ##
  class And < Operator
    NAME = :and

    ##
    # Specifies the condition that each value node conforms to all provided shapes. This is comparable to conjunction and the logical "and" operator.
    #
    # @example
    #   ex:SuperShape
    #   	a sh:NodeShape ;
    #   	sh:property [
    #   		sh:path ex:property ;
    #   		sh:minCount 1 ;
    #   	] .
    #   
    #   ex:ExampleAndShape
    #   	a sh:NodeShape ;
    #   	sh:targetNode ex:ValidInstance, ex:InvalidInstance ;
    #   	sh:and (
    #   		ex:SuperShape
    #   		[
    #   			sh:path ex:property ;
    #   			sh:maxCount 1 ;
    #   		]
    #   	) .
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, path: nil, depth: 0, **options)
      log_debug(NAME, depth: depth) {SXP::Generator.string({node: node}.to_sxp_bin)}
      operands.each do |op|
        results = op.conforms(node, depth: depth + 1, **options)
        if !results.all?(&:conform?)
          return not_satisfied(focus: node, path: path,
            value: node,
            message: "node does not conform to all shapes",
            resultSeverity: options.fetch(:severity),
            component: RDF::Vocab::SHACL.AndConstraintComponent,
            depth: depth, **options)
        end
      end
      satisfy(focus: node, path: path,
        value: node,
        message: "node conforms to all shapes",
        component: RDF::Vocab::SHACL.AndConstraintComponent,
        depth: depth, **options)
    end
  end
end
