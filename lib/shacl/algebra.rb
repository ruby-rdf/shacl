$:.unshift(File.expand_path("../..", __FILE__))
require 'sparql/algebra'
require 'sxp'

module SHACL
  # Based on the SPARQL Algebra, operators for executing a patch
  module Algebra
    autoload :NodeShape,      'shacl/algebra/node_shape.rb'
    autoload :PropertyShape,  'shacl/algebra/property_shape.rb'

    ##
    # Returns the shape operator associated with the vocabulary item
    #
    # @return [SHACL::Algebra::Operator]
    def for(uri)
      {
        RDF::Vocab::SHACL.NodeShape       => NodeShape,
        RDF::Vocab::SHACL.PropertyShape   => PropertyShape,
      }[uri]
    end
    odule_function :for
  end
end


