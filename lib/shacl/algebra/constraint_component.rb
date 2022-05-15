require_relative "operator"

module SHACL::Algebra
  ##
  # Constraint Components define basic constraint behaivor through _mandatory_ and _optional_ parameters. Constraints are accessed through their parameters.
  #
  class ConstraintComponent < Operator
    ## Class methods
    class << self
      # Mandatory parameters are the IRIs of required properties associated with this ConstraintComponent.
      # @return [Array<RDF::URI>]
      attr_reader :mandatory_parameters

      # Optional parameters are the IRIs of optional properties associated with this ConstraintComponent.
      # @return [Array<RDF::URI>]
      attr_reader :optional_parameters

      # A builtin component has only small scalar parameter values and is expressed through options. Otherwise, through operators. 
      # @return [Boolean]
      def builtin?
        false
      end

      # A simple component has only a single mandatory parameter. 
      # @return [Boolean]
      def simple?
        true
      end
    end
  end
end
