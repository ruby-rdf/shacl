require_relative "spec_helper"

describe SHACL::ValidationResult do
  subject {
    SHACL::ValidationResult.new(
      RDF::URI('http://example/#Focus'),
      RDF::URI('http://example/#path'),
      RDF::URI('http://example/#Rectangle'),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
      SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.AndConstraintComponent),
      RDF::Literal("Test details"),
      RDF::URI('http://example/#Focus2'),
      RDF::Literal("Test message")
    )
  }

  describe :conforms? do
    it {is_expected.not_to be_conform}

    it "conforms if nil" do
      subject.resultSeverity = nil
      is_expected.to be_conform
    end

    [RDF::Vocab::SHACL.Info,
     RDF::Vocab::SHACL.Warning,
     RDF::Vocab::SHACL.Violation].each do |sev|
       it "does not conform if #{sev}" do
         subject.resultSeverity = sev
         is_expected.not_to be_conform
       end
    end
  end

  describe :to_sxp do
    let(:expected) {%{(ValidationResult
      (value <http://example/#Focus2>)
      (focus <http://example/#Focus>)
      (path <http://example/#path>)
      (shape <http://example/#Rectangle>)
      (resultSeverity shacl:Violation)
      (component shacl:AndConstraintComponent)
      (details "Test details")
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
        "@id": "http://example/#Focus",
        "@type": "http://example/#Rectangle",
        "http://example/#height": 3
      },
      "resultPath": {
        "@id": "http://example/#path"
      },
      "resultSeverity": "sh:Violation",
      "sourceConstraintComponent": "sh:AndConstraintComponent",
      "details": "Test details",
      "message": "Test message",
      "sourceShape": {
        "@id": "http://example/#Rectangle",
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
                  "@id": "http://example/#width"
                },
                "sh:minCount": 1
              }
            },
            {
              "sh:property": {
                "sh:path": {
                  "@id": "http://example/#height"
                },
                "sh:minCount": 1
              }
            }
          ]
        }
      },
      "sh:value": {"@id": "http://example/#Focus2"}
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

    it "has resultSeverity" do
      expect(native.resultSeverity).to eql(subject.resultSeverity)
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

  context "variations" do
    {
      basic: {
        result: SHACL::ValidationResult.new(
          RDF::URI('http://example/#Focus'),
          RDF::URI('http://example/#path'),
          RDF::URI('http://example/#Rectangle'),
          SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
          SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.AndConstraintComponent),
          RDF::Literal("Test details"),
          RDF::URI('http://example/#Focus2'),
          RDF::Literal("Test message")
        ),
        string: [
          %r{Result for: <http://example/#Focus2>},
          %r{focus: <http://example/#Focus>},
          %r{path: <http://example/#path>},
          %r{shape: <http://example/#Rectangle>},
          %r{resultSeverity: shacl:Violation},
          %r{component: shacl:AndConstraintComponent},
          %r{details: "Test details"},
          %r{message: "Test message"},
        ],
        message: {
          path: {"<http://example/#path>" => [String]}
        },
        ttl: %(
          @prefix sh: <http://www.w3.org/ns/shacl#> .
          @prefix ex: <http://example/#> .

          [ a sh:ValidationResult ;
            sh:value ex:Focus2 ;
            sh:focusNode ex:Focus ;
            sh:resultPath ex:path ;
            sh:sourceShape ex:Rectangle ;
            sh:resultSeverity sh:Violation ;
            sh:sourceConstraintComponent sh:AndConstraintComponent ;
            sh:detail "Test details" ;
            sh:resultMessage "Test message" ;
          ] .
        )
      },
      pathless: {
        result: SHACL::ValidationResult.new(
          RDF::URI('http://example/#Focus'),
          nil,
          RDF::URI('http://example/#Rectangle'),
          SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
          SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.AndConstraintComponent),
          RDF::Literal("Test details"),
          RDF::URI('http://example/#Focus2'),
          RDF::Literal("Test message")
        ),
        string: [
          %r{Result for: <http://example/#Focus2>},
          %r{focus: <http://example/#Focus>},
          %r{shape: <http://example/#Rectangle>},
          %r{resultSeverity: shacl:Violation},
          %r{component: shacl:AndConstraintComponent},
          %r{details: "Test details"},
          %r{message: "Test message"},
        ],
        message: {
          focus: {"<http://example/#Focus>" => [String]}
        },
        ttl: %(
          @prefix sh: <http://www.w3.org/ns/shacl#> .
          @prefix ex: <http://example/#> .

          [ a sh:ValidationResult ;
            sh:value ex:Focus2 ;
            sh:focusNode ex:Focus ;
            sh:sourceShape ex:Rectangle ;
            sh:resultSeverity sh:Violation ;
            sh:sourceConstraintComponent sh:AndConstraintComponent ;
            sh:detail "Test details" ;
            sh:resultMessage "Test message" ;
          ] .
        )
      },
      "path and focusless": {
        result: SHACL::ValidationResult.new(
          nil,
          nil,
          RDF::URI('http://example/#Rectangle'),
          SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.Violation),
          SHACL::Algebra::Operator.iri(RDF::Vocab::SHACL.AndConstraintComponent),
          RDF::Literal("Test details"),
          RDF::URI('http://example/#Focus2'),
          RDF::Literal("Test message")
        ),
        string: [
          %r{Result for: <http://example/#Focus2>},
          %r{shape: <http://example/#Rectangle>},
          %r{resultSeverity: shacl:Violation},
          %r{component: shacl:AndConstraintComponent},
          %r{details: "Test details"},
          %r{message: "Test message"},
        ],
        message: {
          shape: {"<http://example/#Rectangle>" => [String]}
        },
        ttl: %(
          @prefix sh: <http://www.w3.org/ns/shacl#> .
          @prefix ex: <http://example/#> .

          [ a sh:ValidationResult ;
            sh:value ex:Focus2 ;
            sh:sourceShape ex:Rectangle ;
            sh:resultSeverity sh:Violation ;
            sh:sourceConstraintComponent sh:AndConstraintComponent ;
            sh:detail "Test details" ;
            sh:resultMessage "Test message" ;
          ] .
        )
      },
    }.each do |title, params|
      context title do
        subject {params[:result]}
        its(:to_s) do
          params[:string].each do |regexp|
            is_expected.to match(regexp)
          end
        end

        its(:linter_message) do
          is_expected.to include(params[:message])
        end

        it "enumerates statements" do
          expect {|b| subject.each(&b)}.to yield_control
        end

        it "is isomorphic with expected result" do
          g1 = RDF::Repository.new {|r| r << subject}
          g2 = RDF::Repository.new {|r| r << RDF::Turtle::Reader.new(params[:ttl])}
          expect(g1).to be_equivalent_graph(g2)
        end
      end
    end
  end
end
