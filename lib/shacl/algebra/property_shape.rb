require_relative "shape"

module SHACL::Algebra
  ##
  class PropertyShape < Shape
    NAME = :PropertyShape

    # Validates the specified `property` within `graph`, a list of {ValidationResult}.
    #
    # A property conforms the nodes found by evaluating it's `path` all conform.
    #
    # @param [RDF::Term] node
    # @param [Hash{Symbol => Object}] options
    # @return [Array<SHACL::ValidationResult>]
    #   Returns a validation result for each value node.
    def conforms(node, depth: 0, **options)
      return [] if deactivated?
      options = id ? options.merge(shape: id) : options
      path = parse_path(@options[:path])
      log_debug(NAME, depth: depth) {SXP::Generator.string({id: id, node: node, path: path}.to_sxp_bin)}

      # Turn the `path` attribute into a SPARQL Property Path and evaluate to find related nodes.
      if path.is_a?(RDF::URI)
        value_nodes = graph.query(subject: node, predicate: path).objects

        # Evaluate against builtins
        builtin_results = @options.map do |k, v|
          self.send("builtin_#{k}".to_sym, v, node, path, value_nodes, depth: depth + 1, **options) if self.respond_to?("builtin_#{k}".to_sym)
        end.flatten.compact

        # Evaluate against operands
        op_results = operands.map do |op|
          value_nodes.map do |n|
            op.conforms(n, depth: depth + 1, **options)
          end
        end.flatten.compact

        builtin_results + op_results
      else
        log_error(NAME, "Can't handle path", depth: depth) {path.to_sxp}
      end
    end

    ##
    # Parse the "patH" attribute into a SPARQL Property Path and evaluate to find related nodes.
    #
    # @param [Object] path
    # @return [RDF::URI, SPARQL::Algebra::Expression]
    def parse_path(path)
      case path
      when String then iri(path, **@options)
      else
        if path.is_a?(Hash) && path['id']
          iri(path['id'], **@options)
        else
          log_error(NAME, "Can't handle path") {path.to_sxp}
        end
      end
    end

    def compare(method, property, node,path, value_nodes, **options)
      nodes = graph.query(subject: node, predicate: property).objects
      value_nodes.map do |left|
        nodes.map do |right|
          unless (left.simple? && right.simple?) ||
            (left.is_a?(RDF::Literal::Numeric) && right.is_a?(RDF::Literal::Numeric)) ||
            (left.datatype == right.datatype && left.language == right.language)
            not_satisfied(focus: node, path: path,
              value: left,
              message: "value is incomperable with #{right.to_sxp}",
              component: RDF::Vocab::SHACL.LessThanConstraintComponent,
              **options)
          else
            conforms = left.send(method, right)
            satisfy(focus: node, path: path,
              value: left,
              message: "should be #{method} than #{right.to_sxp}",
              severity: (conforms ? RDF::Vocab::SHACL.Info : RDF::Vocab::SHACL.Violation),
              component: RDF::Vocab::SHACL.LessThanConstraintComponent,
              **options)
          end
        end
      end.flatten.compact
    end

    # Specifies the condition that each value node is smaller than all the objects of the triples that have the focus node as subject and the value of sh:lessThan as predicate.
    #
    # @example
    #   ex:LessThanExampleShape
    #   	a sh:NodeShape ;
    #   	sh:property [
    #   		sh:path ex:startDate ;
    #   		sh:lessThan ex:endDate ;
    #   	] .
    #
    # @param [RDF::URI] property the property of the focus node whose values must be equal to some value node.
    # @param [RDF::Term] node the focus node
    # @param [RDF::URI] path (nil) the property path from the focus node to the     # @param [Array<RDF::Term>] value_nodes
    # @return [Array<SHACL::ValidationResult>]
    def builtin_lessThan(property, node, path, value_nodes, **options)
      compare(:<, property, node, path, value_nodes, **options)
    end
    def builtin_lessThanOrEquals(property, node, path, value_nodes, **options)
      compare(:<=, property, node, path, value_nodes, **options)
    end
    def builtin_greaterThan(property, node, path, value_nodes, **options)
      compare(:>, property, node, path, value_nodes, **options)
    end
    def builtin_greaterThanOrEquals(property, node, path, value_nodes, **options)
      compare(:>=, property, node, path, value_nodes, **options)
    end

    ##
    # Builin evaluators
    ##

    # Specifies the maximum number of value nodes.
    #
    # @param [Integer] count
    # @param [RDF::Term] node the focus node
    # @param [RDF::URI] path (nil) the property path from the focus node to the     # @param [Array<RDF::Term>] value_nodes
    # @param [Array<RDF::Term>] value_nodes
    # @return [Array<SHACL::ValidationResult>]
    def builtin_maxCount(count, node, path, value_nodes, **options)
      satisfy(focus: node, path: path,
        message: "maxCount #{value_nodes.count} <= #{count}",
        severity: (value_nodes.count <= count.to_i ? RDF::Vocab::SHACL.Info : RDF::Vocab::SHACL.Violation),
        component: RDF::Vocab::SHACL.MaxCountConstraintComponent,
        **options)
    end

    # Specifies the minimum number of value nodes.
    #
    # @example
    #   ex:MinCountExampleShape
    #   	a sh:PropertyShape ;
    #   	sh:targetNode ex:Alice, ex:Bob ;
    #   	sh:path ex:name ;
    #   	sh:minCount 1 .
    #
    # @param [Integer] count
    # @param [RDF::Term] node the focus node
    # @param [RDF::URI] path (nil) the property path from the focus node to the     # @param [Array<RDF::Term>] value_nodes
    # @param [Array<RDF::Term>] value_nodes
    # @return [Array<SHACL::ValidationResult>]
    def builtin_minCount(count, node, path, value_nodes, **options)
      satisfy(focus: node, path: path,
        message: "minCount #{value_nodes.count} >= #{count}",
        severity: (value_nodes.count >= count.to_i ? RDF::Vocab::SHACL.Info : RDF::Vocab::SHACL.Violation),
        component: RDF::Vocab::SHACL.MinCountConstraintComponent,
        **options)
    end

    # The property `sh:uniqueLang` can be set to `true` to specify that no pair of value nodes may use the same language tag.
    #
    # @param [Boolean] uniq
    # @param [RDF::Term] node the focus node
    # @param [RDF::URI] path (nil) the property path from the focus node to the     # @param [Array<RDF::Term>] value_nodes
    # @param [Array<RDF::Term>] value_nodes
    # @return [Array<SHACL::ValidationResult>]
    def builtin_uniqueLang(uniq, node, path, value_nodes, **options)
      if !value_nodes.all?(&:literal?)
        not_satisfied(focus: node, path: path,
          message: "not all values are literals",
          component: RDF::Vocab::SHACL.UniqueLangConstraintComponent,
          **options)
      elsif value_nodes.map(&:language).length != value_nodes.map(&:language).uniq.length
        not_satisfied(focus: node, path: path,
          message: "not all values have unique language tags",
          component: RDF::Vocab::SHACL.UniqueLangConstraintComponent,
          **options)
      else
        satisfy(focus: node, path: path,
          message: "all literals have unique language tags",
          severity: (value_nodes.count <= count.to_i ? RDF::Vocab::SHACL.Info : RDF::Vocab::SHACL.Violation),
          component: RDF::Vocab::SHACL.UniqueLangConstraintComponent,
          **options)
      end
    end
  end
end
