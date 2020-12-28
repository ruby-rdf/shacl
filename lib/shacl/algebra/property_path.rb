
module SHACL::Algebra
  ##
  # Parse a SHACL property path into an SPARQL path operator
  module PropertyPath
    include RDF::Util::Logger

    ##
    # Parse the "patH" attribute into a SPARQL Property Path and evaluate to find related nodes.
    #
    # @param [Object] path
    # @return [RDF::URI, SPARQL::Algebra::Expression]
    def parse_path(path, **options)
      case path
      when RDF::URI then path
      when String then iri(path)
      when Hash
        # Creates a SPARQL S-Expression resulting in a query which can be used to find corresponding
        {
          alternativePath: :alt,
          inversePath: :reverse,
          oneOrMorePath: :"path+",
          "@list": :seq,
          zeroOrMorePath: :"path*",
          zeroOrOnePath: :"path?",
        }.each do |prop, op_sym|
          if path[prop.to_s]
            value = path[prop.to_s]
            value = value['@list'] if value.is_a?(Hash) && value.key?('@list')
            value = [value] if !value.is_a?(Array)
            value = value.map {|e| parse_path(e, **options)}
            op = SPARQL::Algebra::Operator.for(op_sym)
            if value.length > op.arity
              # Divide into the first operand followed by the operator re-applied to the reamining operands
              value = value.first, apply_op(op, value[1..-1])
            end
            return op.new(*value)
          end
        end

        if path['id']
          iri(path['id'])
        else
          log_error('PropertyPath', "Can't handle path") {path.to_sxp}
        end
      else
        log_error('PropertyPath', "Can't handle path") {path.to_sxp}
      end
    end
    module_function :parse_path

    # Recursively apply operand to sucessive values until the argument count which is expected is achieved
    def apply_op(op, values)
      if values.length > op.arity
        values = values.first, apply_op(op, values[1..-1])
      end
      op.new(*values)
    end
  end
end