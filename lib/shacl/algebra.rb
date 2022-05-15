$:.unshift(File.expand_path("../..", __FILE__))
require 'sxp'
require_relative "algebra/operator"
require_relative "algebra/constraint_component"

module SHACL
  # Based on the SPARQL Algebra, operators for executing a patch
  module Algebra
    autoload :AndConstraintComponent,      'shacl/algebra/and.rb'
    #autoload :DatatypeConstraintComponent, 'shacl/algebra/datatype.rb'
    #autoload :ClassConstraintComponent,    'shacl/algebra/class.rb'
    autoload :NodeShape,                   'shacl/algebra/node_shape.rb'
    autoload :NotConstraintComponent,      'shacl/algebra/not.rb'
    autoload :OrConstraintComponent,       'shacl/algebra/or.rb'
    autoload :PropertyShape,               'shacl/algebra/property_shape.rb'
    autoload :QualifiedValueShape,         'shacl/algebra/qualified_value_shape.rb'
    autoload :Shape,                       'shacl/algebra/shape.rb'
    autoload :SPARQLConstraintComponent,   'shacl/algebra/sparql_constraint.rb'
    autoload :XoneConstraintComponent,     'shacl/algebra/xone.rb'

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


