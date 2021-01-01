module SHACL::Algebra
  ##
  class QualifiedValueShape < Operator
    NAME = :qualifiedValueShape

    ##
    # Specifies the condition that a specified number of value nodes conforms to the given shape. Each `sh:qualifiedValueShape` can have: one value for `sh:qualifiedMinCount`, one value for s`h:qualifiedMaxCount` or, one value for each, at the same subject.
    #
    # @param [Array<RDF::Term>] value_nodes
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, path:, value_nodes:, depth: 0, **options)
      log_debug(NAME, depth: depth) {SXP::Generator.string({node: node, value_nodes: value_nodes}.to_sxp_bin)}
      max_count = options.fetch(:qualifiedMaxCount, 0).to_i
      min_count = options.fetch(:qualifiedMinCount, 0).to_i
      # FIXME: figure this out
      disjoint = options[:qualifiedValueShapesDisjoint]

      operands.map do |op|
        results = value_nodes.map do |n|
          op.conforms(n, depth: depth + 1, **options)
        end.flatten.compact

        count = results.select(&:conform?).length
        log_debug(NAME, depth: depth) {"#{count}/#{results} conforming shapes"}
        if count < min_count
          not_satisfied(focus: node, path: path,
            message: "only #{count} conforming values, requires at least #{min_count}",
            component: RDF::Vocab::SHACL.QualifiedMinCountConstraintComponent,
            depth: depth, **options)
        elsif count > max_count
          not_satisfied(focus: node, path: path,
            message: "#{count} conforming values, requires at most #{max_count}",
            component: RDF::Vocab::SHACL.QualifiedMaxCountConstraintComponent,
            depth: depth, **options)
        else
          satisfy(focus: node, path: path,
            message: "#{min_count} <= #{count} <= #{max_count} values conform",
            component: RDF::Vocab::SHACL.QualifiedMinCountConstraintComponent,
            depth: depth, **options)
        end
      end
    end
  end
end
