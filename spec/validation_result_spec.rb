require_relative "spec_helper"

describe SHACL::ValidationResult do
  subject {
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

  describe :conforms? do
    it {is_expected.not_to be_conform}

    it "conforms if Info" do
      subject.severity = RDF::Vocab::SHACL.Info
      is_expected.to be_conform
    end

    it "conforms if Warning" do
      subject.severity = RDF::Vocab::SHACL.Warning
      is_expected.to be_conform
    end
  end

  describe :to_sxp do
    let(:expected) {%{(ValidationResult
      (focus <http://datashapes.org/sh/tests/core/node/and-001.test#InvalidRectangle1>)
      (path <http://datashapes.org/sh/tests/core/node/and-001.test#address>)
      (shape <http://datashapes.org/sh/tests/core/node/and-001.test#Rectangle>)
      (severity shacl:Violation)
      (component shacl:AndConstraintComponent)
      (details "Test details")
      (value <http://datashapes.org/sh/tests/core/node/and-001.test#InvalidRectangle2>)
      (message "Test message")
    )}}
    it "generates expected SXP" do
      sxp = subject.to_sxp
      expect(sxp).to generate(expected)
    end
  end

  describe :from_json do
    let(:logger) {RDF::Spec.logger}
    let(:json) {%({
      "@type": "sh:ValidationResult",
      "focusNode": {
        "@id": "http://datashapes.org/sh/tests/core/node/and-001.test#InvalidRectangle1",
        "@type": "http://datashapes.org/sh/tests/core/node/and-001.test#Rectangle",
        "http://datashapes.org/sh/tests/core/node/and-001.test#height": 3
      },
      "resultPath": {
        "@id": "http://datashapes.org/sh/tests/core/node/and-001.test#address"
      },
      "resultSeverity": "sh:Violation",
      "sourceConstraintComponent": "sh:AndConstraintComponent",
      "details": "Test details",
      "message": "Test message",
      "sourceShape": {
        "@id": "http://datashapes.org/sh/tests/core/node/and-001.test#Rectangle",
        "@type": [
          "rdfs:Class",
          "sh:NodeShape"
        ],
        "rdfs:subClassOf": {
          "@id": "rdfs:Resource"
        },
        "sh:and": {
          "@list": [
            {
              "sh:property": {
                "sh:path": {
                  "@id": "http://datashapes.org/sh/tests/core/node/and-001.test#width"
                },
                "sh:minCount": 1
              }
            },
            {
              "sh:property": {
                "sh:path": {
                  "@id": "http://datashapes.org/sh/tests/core/node/and-001.test#height"
                },
                "sh:minCount": 1
              }
            }
          ]
        }
      },
      "sh:value": {"@id": "http://datashapes.org/sh/tests/core/node/and-001.test#InvalidRectangle2"}
    })}
    let!(:native) {SHACL::ValidationResult.from_json(json, logger: logger)}

    it "has focus" do
      expect(native.focus).to eql(subject.focus)
    end

    it "has path" do
      expect(native.path).to eql(subject.path)
    end

    it "has shape" do
      expect(native.shape).to eql(subject.shape)
    end

    it "has severity" do
      expect(native.severity).to eql(subject.severity)
    end

    it "has component" do
      expect(native.component).to eql(subject.component)
    end

    it "has details" do
      expect(native.details).to eql(subject.details)
    end

    it "has value" do
      expect(native.value).to eql(subject.value)
    end

    it "has message" do
      expect(native.message).to eql(subject.message)
    end
  end
end
