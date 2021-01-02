require_relative "spec_helper"

describe SHACL::ValidationReport do
  let!(:report) {
    SHACL::ValidationResult.new(
      RDF::URI('http://datashapes.org/sh/tests/core/node/and-001.test#InvalidRectangle1'),
      RDF::URI('http://datashapes.org/sh/tests/core/node/and-001.test#address'),
      RDF::URI('http://datashapes.org/sh/tests/core/node/and-001.test#Rectangle'),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.AndConstraintComponent),
      RDF::Literal("Test details"),
      RDF::URI('http://datashapes.org/sh/tests/core/node/and-001.test#InvalidRectangle2'),
      RDF::Literal("Test message")
    )
  }
  subject {SHACL::ValidationReport.new([report])}

  describe :conforms? do
    it {is_expected.not_to be_conform}
  end

  describe :to_sxp do
    let(:expected) {
      [:ValidationReport, false, [report]].to_sxp
    }

    it "generates expected SXP" do
      sxp = subject.to_sxp
      expect(sxp).to generate(expected)
    end
  end

  describe "#each" do
    let(:expected) {%(
      @prefix sh: <http://www.w3.org/ns/shacl#> .
      @prefix ex: <http://datashapes.org/sh/tests/core/node/and-001.test#> .

      [
        a sh:ValidationReport ;
        sh:conforms false ;
        sh:result [ a sh:ValidationResult ;
          sh:value ex:InvalidRectangle2 ;
          sh:focusNode ex:InvalidRectangle1 ;
          sh:resultPath ex:address ;
          sh:sourceShape ex:Rectangle ;
          sh:resultSeverity sh:Violation ;
          sh:sourceConstraintComponent sh:AndConstraintComponent ;
          sh:detail "Test details" ;
          sh:resultMessage "Test message" ;
        ]
      ] .
    )}

    it "enumerates statements" do
      expect {|b| subject.each(&b)}.to yield_control.exactly(12).times
    end

    it "is isomorphic with expected result" do
      g1 = RDF::OrderedRepo.new {|r| r << subject}
      g2 = RDF::OrderedRepo.new {|r| r << RDF::Turtle::Reader.new(expected)}
      expect(g1).to be_equivalent_graph(g2)
    end
  end
end
