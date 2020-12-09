$:.unshift(File.expand_path("../..", __FILE__))
require 'sxp'
require_relative "algebra/operator"

module SHACL
  # Based on the SPARQL Algebra, operators for executing a patch
  module Algebra
    autoload :NodeShape,      'shacl/algebra/node_shape.rb'
    autoload :PropertyShape,  'shacl/algebra/property_shape.rb'
    autoload :Shape,          'shacl/algebra/shape.rb'
    autoload :And,            'shacl/algebra/and.rb'
    autoload :Klass,          'shacl/algebra/klass.rb'
    autoload :Datatype,       'shacl/algebra/datatype.rb'
    autoload :Not,            'shacl/algebra/not.rb'
    autoload :Or,             'shacl/algebra/or.rb'
    autoload :Xone,           'shacl/algebra/xone.rb'

    def self.from_json(operator, **options)
      raise ArgumentError unless operator.is_a?(Hash)
      type = operator.fetch('type', [])
      type << (operator["path"] ? 'PropertyShape' : 'NodeShape') if type.empty?
      klass = case
      when type.include?('NodeShape') then NodeShape
      when type.include?('PropertyShape') then PropertyShape
      else raise ArgumentError, "unknown type #{type.inspect}"
      end

      klass.from_json(operator, **options)
    end
  end
end


