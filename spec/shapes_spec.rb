require_relative "spec_helper"

describe SHACL::Shapes do
  describe ".from_graph" do
    context "with a simple NodeShape" do
      {
        "node shape": {
          shape: %(
            @prefix ex: <http://example.org/node> .
            @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
            @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
            @prefix sh: <http://www.w3.org/ns/shacl#> .

            ex:Node
              rdf:type sh:NodeShape, rdfs:Class ;
              rdfs:label "Test class" ;
              sh:node [ sh:class ex:OtherClass ] ;
              .
          ),
          sxp: %{(shapes (
              (NodeShape
                (id <http://example.org/nodeNode>)
                (type shacl:NodeShape rdfs:Class)
                (label "Test class")
                (NodeShape (id _:b0) (class <http://example.org/nodeOtherClass>))
              )
              (NodeShape (id _:b0) (class <http://example.org/nodeOtherClass>))
            )
          )},
          data: {
            "node with type matching shape": {
              input: %(
                @prefix ex: <http://example.org/node> .
                @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
                @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

                ex:ValidInstance
                  rdf:type ex:OtherClass ;
                  rdf:type ex:TestClass ;
                  rdfs:label "Valid instance" .
              ),
              valid: true,
              sxp: [:ValidationReport, true, []].to_sxp
            }
          }
        },
        "nested node shape with closed properties": {
          shape: %(
            @prefix sh: <http://www.w3.org/ns/shacl#> .
            @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
            @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
            @prefix ex: <http://example.org/ns#> .

            ex:WithLabelShape a sh:NodeShape ;
                sh:closed true ;
                sh:property [
                    sh:path rdfs:label ;
                    sh:minCount 1 ;
                    sh:maxCount 1 ;
                ] .

            ex:WithCommentShape a sh:NodeShape ;
                sh:closed true ;
                sh:property [
                    sh:path rdfs:comment ;
                    sh:minCount 1 ;
                    sh:maxCount 1 ;
                ] .

            ex:ResourceShape a sh:NodeShape ;
                sh:targetClass ex:Resource ;
                sh:or ( ex:WithLabelShape ex:WithCommentShape ) .

            ),
          sxp: %{(shapes
           (
            (NodeShape
             (id <http://example.org/ns#WithLabelShape>)
             (type shacl:NodeShape)
             (closed true)
             (PropertyShape (id _:b0) (path rdfs:label) (minCount 1) (maxCount 1)))
            (NodeShape
             (id <http://example.org/ns#WithCommentShape>)
             (type shacl:NodeShape)
             (closed true)
             (PropertyShape (id _:b1) (path rdfs:comment) (minCount 1) (maxCount 1)))
            (NodeShape
             (id <http://example.org/ns#ResourceShape>)
             (type shacl:NodeShape)
             (targetClass <http://example.org/ns#Resource>)
             (or
              (NodeShape
               (id <http://example.org/ns#WithLabelShape>)
               (type shacl:NodeShape)
               (closed true)
               (PropertyShape (id _:b0) (path rdfs:label) (minCount 1) (maxCount 1)))
              (NodeShape
               (id <http://example.org/ns#WithCommentShape>)
               (type shacl:NodeShape)
               (closed true)
               (PropertyShape (id _:b1) (path rdfs:comment) (minCount 1) (maxCount 1)))
             )) ))},
          data: {
            "node which is neither of given shapes": {
              input: %(
                @prefix ex: <http://example.org/ns#> .
                @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

                ex:Resource1 a ex:Resource ;
                    rdfs:label "A Resource with a label" ;
                    ex:extraProperty "This should not be here" .),
              valid: false,
              sxp: %{
              (ValidationReport #f
               (
                (ValidationResult
                 (value <http://example.org/ns#Resource1>)
                 (focus <http://example.org/ns#Resource1>)
                 (shape <http://example.org/ns#ResourceShape>)
                 (resultSeverity shacl:Violation)
                 (component shacl:OrConstraintComponent)
                 (message "node does not conform to any shape")) ))
              }
            }
          }
        }
      }.each do |name, params|
        context name do
          let!(:shapes) {parse_shapes(params[:shape], **params)}
          it "#to_sxp" do
            sxp = shapes.to_sxp
            expect(sxp).to generate(params[:sxp])
          end

          params[:data].each do |n, p|
            context(p[:n]) do
              let!(:input) {parse_ttl(p[:input])}
              let!(:report) {shapes.execute(input)}

              if p[:valid]
                it "conforms" do
                  expect(report).to be_conform
                end
              else
                it "does not conform" do
                  expect(report).not_to be_conform
                end
              end

              it "#to_sxp" do
                sxp = report.to_sxp
                expect(sxp).to generate(p[:sxp])
              end
            end
          end
        end
      end
    end
  end

  describe ".from_queryable" do
    let(:dataGraph) {%(
      @prefix sh: <http://www.w3.org/ns/shacl#> .

      [ sh:shapesGraph <http://example/shapes>] .
    )}

    it "gets shapes from queryable" do
      g = parse_ttl(dataGraph)
      expect(RDF::Util::File).to receive(:open_file).with("http://example/shapes", any_args)
      SHACL::Shapes.from_queryable(g)
    end
  end

  def parse_ttl(src)
    RDF::Repository.new do |r|
      r << RDF::Turtle::Reader.new(src)
    end
  end

  def parse_shapes(src, **options)
    g = parse_ttl(src)
    SHACL::Shapes.from_graph(g, **options)
  end
end
