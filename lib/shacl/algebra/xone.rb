module SHACL::Algebra
  ##
  class Xone < Operator
    NAME = :xone

    ##
    # Specifies the condition that each value node conforms to exactly one of the provided shapes.
    #
    # @example
    #   ex:XoneConstraintExampleShape
    #   	a sh:NodeShape ;
    #   	sh:targetClass ex:Person ;
    #   	sh:xone (
    #   		[
    #   			sh:property [
    #   				sh:path ex:fullName ;
    #   				sh:minCount 1 ;
    #   			]
    #   		]
    #   		[
    #   			sh:property [
    #   				sh:path ex:firstName ;
    #   				sh:minCount 1 ;
    #   			] ;
    #   			sh:property [
    #   				sh:path ex:lastName ;
    #   				sh:minCount 1 ;
    #   			]
    #   		]
    #   	) .
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, depth: 0, **options)
      log_debug(NAME, depth: depth) {SXP::Generator.string({node: node}.to_sxp_bin)}
      operands.each do |op|
        results = op.conforms(node, depth: depth + 1, **options)
        conforming = results.select(&:conform?).length
        case conforming
        when 0
          return not_satisfied(
            focus: node,
            value: node,
            message: "no shapes matches node",
            component: RDF::Vocab::SHACL.XoneConstraintComponent,
            depth: depth, **options)
        when 1
        else
          return not_satisfied(
            focus: node,
            value: node,
            message: "more than one shape matches node",
            component: RDF::Vocab::SHACL.XoneConstraintComponent,
            depth: depth, **options)
        end
      end
      satisfy(
        focus: node,
        value: node,
        message: "a single shape matches the node",
        component: RDF::Vocab::SHACL.XoneConstraintComponent,
        depth: depth, **options)
    end
  end
end
