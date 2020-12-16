module SHACL::Algebra
  ##
  class QualifiedValueShape < Operator
    NAME = :qualifiedValueShape

    ##
    # Specifies the condition that a specified number of value nodes conforms to the given shape. Each `sh:qualifiedValueShape` can have: one value for `sh:qualifiedMinCount`, one value for s`h:qualifiedMaxCount` or, one value for each, at the same subject.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    def conforms(node, depth: 0, **options)
      log_debug(NAME, depth: depth) {SXP::Generator.string({node: node}.to_sxp_bin)}
      max_count = options.fetch(:qualifiedMaxCount, 0)
      min_count = options.fetch(:qualifiedMinCount, 0)
      operands.map do |op|
        results = op.conforms(node, depth: depth + 1, **options)
        count = results.select(&:conform?).length
        log_debug(NAME, depth: depth) {"#{count}/#{results} conforming shapes"}
        if count < min_count
          not_satisfied(
            focus: node,
            value: node,
            message: "only #{count} conforming values, requires at least #{min_count}",
            component: RDF::Vocab::SHACL.QualifiedMinCountConstraintComponent,
            depth: depth, **options)
        elsif count > max_count
          not_satisfied(
            focus: node,
            value: node,
            message: "#{count} conforming values, requires at most #{max_count}",
            component: RDF::Vocab::SHACL.QualifiedMaxCountConstraintComponent,
            depth: depth, **options)
        else
          results
        end
      end.flatten.compact
    end
  end
end
