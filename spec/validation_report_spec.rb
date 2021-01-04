require_relative "spec_helper"

describe SHACL::ValidationReport do
  let!(:report) {
    SHACL::ValidationResult.new(
      RDF::URI('http://example/#Focus'),
      RDF::URI('http://example/#path'),
      RDF::URI('http://example/#Shape'),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.AndConstraintComponent),
      RDF::Literal("Test details"),
      RDF::URI('http://example/#Value'),
      RDF::Literal("Test message")
    )
  }
  let!(:report2) {
    SHACL::ValidationResult.new(
      RDF::URI('http://example/#Focus2'),
      nil,
      RDF::URI('http://example/#Shape2'),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.NodeConstraintComponent),
      RDF::Literal("Test details 2"),
      RDF::URI('http://example/#Value2'),
      RDF::Literal("Test message 2")
    )
  }
  subject {SHACL::ValidationReport.new([report, report2])}

  describe :conforms? do
    it {is_expected.not_to be_conform}
  end

  describe :to_sxp do
    let(:expected) {
      [:ValidationReport, false, [report, report2]].to_sxp
    }

    it "generates expected SXP" do
      sxp = subject.to_sxp
      expect(sxp).to generate(expected)
    end
  end

  its(:to_s) do
    [
      %r(Result for: <http://example/#Value>),
      %r(Result for: <http://example/#Value2>),
    ].each do |regexp|
      is_expected.to match(regexp)
    end
  end

  its(:linter_messages) do
    is_expected.to include({
      path: {"<http://example/#path>" => [String]},
      focus: {"<http://example/#Focus2>" =>[String]}
    })
  end

  describe "#each" do
    let(:expected) {%(
      @prefix shacl: <http://www.w3.org/ns/shacl#> .
      @prefix ex: <http://example/#> .
      @prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

      [
        a shacl:ValidationReport;
        shacl:conforms "false"^^xsd:boolean;
        shacl:result [
          a shacl:ValidationResult;
          shacl:detail "Test details 2";
          shacl:focusNode <http://example/#Focus2>;
          shacl:resultMessage "Test message 2";
          shacl:resultSeverity shacl:Violation;
          shacl:sourceConstraintComponent shacl:NodeConstraintComponent;
          shacl:sourceShape <http://example/#Shape2>;
          shacl:value <http://example/#Value2>
        ], [
          a shacl:ValidationResult;
          shacl:detail "Test details";
          shacl:focusNode <http://example/#Focus>;
          shacl:resultMessage "Test message";
          shacl:resultPath <http://example/#path>;
          shacl:resultSeverity shacl:Violation;
          shacl:sourceConstraintComponent shacl:AndConstraintComponent;
          shacl:sourceShape <http://example/#Shape>;
          shacl:value <http://example/#Value>
        ]
      ] .
    )}

    it "enumerates statements" do
      expect {|b| subject.each(&b)}.to yield_control
    end

    it "is isomorphic with expected result" do
      g1 = RDF::OrderedRepo.new {|r| r << subject}
      g2 = RDF::OrderedRepo.new {|r| r << RDF::Turtle::Reader.new(expected)}
      expect(g1).to be_equivalent_graph(g2)
    end
  end
end
