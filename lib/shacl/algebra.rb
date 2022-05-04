$:.unshift(File.expand_path("../..", __FILE__))
require 'sxp'
require_relative "algebra/operator"

module SHACL
  # Based on the SPARQL Algebra, operators for executing a patch
  module Algebra
    autoload :And,                  'shacl/algebra/and.rb'
    autoload :Datatype,             'shacl/algebra/datatype.rb'
    autoload :Klass,                'shacl/algebra/klass.rb'
    autoload :NodeShape,            'shacl/algebra/node_shape.rb'
    autoload :Not,                  'shacl/algebra/not.rb'
    autoload :Or,                   'shacl/algebra/or.rb'
    autoload :PropertyShape,        'shacl/algebra/property_shape.rb'
    autoload :QualifiedValueShape,  'shacl/algebra/qualified_value_shape.rb'
    autoload :Shape,                'shacl/algebra/shape.rb'
    autoload :SPARQLConstraint,     'shacl/algebra/sparql_constraint.rb'
    autoload :Xone,                 'shacl/algebra/xone.rb'

    def self.from_json(operator, **options)
      raise ArgumentError, "from_json: operator not a Hash: #{operator.inspect}" unless operator.is_a?(Hash)
      type = operator.fetch('type', [])
      type << (operator["path"] ? 'PropertyShape' : 'NodeShape') if type.empty?
      klass = case
      when type.include?('NodeShape') then NodeShape
      when type.include?('PropertyShape') then PropertyShape
      else raise ArgumentError, "from_json: unknown type #{type.inspect}"
      end

      klass.from_json(operator, **options)
    end
  end
end


