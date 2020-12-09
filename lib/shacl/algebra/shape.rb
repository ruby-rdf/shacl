module SHACL::Algebra
  ##
  class Shape < Operator
    NAME = :Shape

    ##
    # Builin evaluators. These evaulators may be used on either NodeShapes or PropertyShapes.
    ##

    # Specifies that each value node is a SHACL instance of a given type.
    #
    # @param [RDF::URI] type
    # @param [Array<RDF::Term>] value_nodes
    # @return [Array<SHACL::ValidationResult>]
    def builtin_class(type, node, path, value_nodes, **options)
      value_nodes.map do |n|
        has_type = n.resource? && graph.query(subject: n, predicate: RDF.type, object:type)
        satisfy(focus: node, path: path,
          value: n,
          message: "should be of class #{type}",
          severity: (has_type ? RDF::Vocab::SHACL.Info : RDF::Vocab::SHACL.Violation),
          component: RDF::Vocab::SHACL.ClassConstraintComponent,
          **options)
      end.flatten.compact
    end
  end
end
