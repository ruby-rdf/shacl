# Localized refinements to externally defined classes
module SHACL::Refinements
  refine Hash do
    # @!parse
    #   # Refinements on Hash
    #   class Hash
    #     ##
    #     # Deep merge two hashes folding array values together.
    #     #
    #     # @param  [Hash] second
    #     # @return [Hash]
    #     def deep_merge(second); end
    #   end
    def deep_merge(second)
      merger = ->(_, v1, v2) {Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : v2.nil? ? v1 : v2 }
      merge(second.to_h, &merger)
    end
  end
end