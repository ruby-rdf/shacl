
module SHACL::Algebra
  ##
  # Parse a SHACL property path into an SPARQL path operator
  module PropertyPath

    ##
    # Parse the "patH" attribute into a SPARQL Property Path and evaluate to find related nodes.
    #
    # @param [Object] path
    # @return [RDF::URI, SPARQL::Algebra::Expression]
    def parse_path(path)
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
            value = value.map {|e| parse_path(e)}
            op = SPARQL::Algebra::Operator.for(op_sym)
            return op.new(*value)
          end
        end

        if path['id']
          iri(path['id'])
        else
          log_error(NAME, "Can't handle path") {path.to_sxp}
        end
      else
        log_error(NAME, "Can't handle path") {path.to_sxp}
      end
    end
    module_function :parse_path
  end
end