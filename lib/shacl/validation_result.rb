$:.unshift(File.expand_path("../..", __FILE__))

require 'sxp'
require_relative 'context'

module SHACL
  # A SHACL [Validateion Result](https://www.w3.org/TR/shacl/#results-validation-result).
  #
  # Also allows for a successful result, if the `resultSeverity` is sh:Info.
  ValidationResult = Struct.new(
    :focus,
    :path,
    :shape,
    :resultSeverity,
    :component,
    :details,
    :value,
    :message) do

    # A result conforms if it is not a violation
    #
    # @return [Boolean]
    def conform?
      resultSeverity == RDF::Vocab::SHACL.Info
    end
    alias_method :conforms?, :conform?

    def to_sxp_bin
      [:value, :focus, :path, :shape, :resultSeverity, :component, :details, :message].inject([:ValidationResult]) do |memo, sym|
        v = to_h[sym]
        if v.respond_to?(:qname) && !v.lexical && v.qname
          v = RDF::URI.new(v.to_s) if v.frozen?
          v.lexical = v.qname.join(':')
        end
        v ? (memo + [[sym, *v]]) : memo
      end.to_sxp_bin
    end

    def to_sxp
      self.to_sxp_bin.to_sxp
    end

    # Transform a JSON representation of a result, into a native representation
    # @param [Hash] input
    # @return [ValidationResult]
    def self.from_json(input, **options)
      input = JSON.parse(input) if input.is_a?(String)
      input = JSON::LD::API.compact(input,
                "http://github.com/ruby-rdf/shacl/",
                expandContext: "http://github.com/ruby-rdf/shacl/")
      raise ArgumentError, "Expect report to be a hash" unless input.is_a?(Hash)
      result = self.new

      result.focus = Algebra::Operator.to_rdf(:focus, input['focusNode'], base: nil, vocab: false) if input['focusNode']
      result.path = Algebra::Operator.parse_path(input['resultPath'], **options) if input['resultPath']
      result.resultSeverity = Algebra::Operator.iri(input['resultSeverity'], **options) if input['resultSeverity']
      result.component = Algebra::Operator.iri(input['sourceConstraintComponent'], **options) if input['sourceConstraintComponent']
      result.shape = Algebra::Operator.iri(input['sourceShape'], **options) if input['sourceShape']
      result.value = Algebra::Operator.to_rdf(:value, input['value'], **options) if input['value']
      result.details = Algebra::Operator.to_rdf(:details, input['details'], **options) if input['details']
      result.message = Algebra::Operator.to_rdf(:message, input['message'], **options) if input['message']
      result
    end

    # To results are eql? if their overlapping properties are equal
    # @param [ValidationResult] other
    # @return [Boolean]
    def ==(other)
      return false unless other.is_a?(ValidationResult)
      %w(focus path resultSeverity component shape value).map(&:to_sym).all? do |prop|
        ours = self.send(prop)
        theirs = other.send(prop)
        ours.nil? || theirs.nil? || (ours.node? && theirs.node?) || ours.eql?(theirs)
      end
    end

    # Inspect as SXP
    def inspect
      SXP::Generator.string to_sxp_bin
    end
  end
end
