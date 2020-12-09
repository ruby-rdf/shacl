$:.unshift(File.expand_path("../..", __FILE__))

module SHACL
  # A SHACL [Validateion Result](https://www.w3.org/TR/shacl/#results-validation-result).
  #
  # Also allows for a successful result, if the `severity` is not set.
  ValidationResult = Struct.new(
    :focus,
    :path,
    :shape,
    :severity,
    :component,
    :details,
    :value,
    :message,
    keyword_init: true) do

    # A result conforms if it is not a violation
    #
    # @return [Boolean]
    def conform?
      severity != RDF::Vocab::SHACL.Violation
    end
    alias_method :conforms?, :conform?

    def to_sxp_bin
      [:focus, :path, :shape, :severity, :component, :details, :value, :message].inject([:ValidationResult]) do |memo, sym|
        v = to_h[sym]
        v = v.pname if v.respond_to?(:pname)
        v ? (memo + [sym, *v]) : memo
      end.to_sxp_bin
    end

    def to_sxp
      self.to_sxp_bin.to_sxp
    end
  end
end
