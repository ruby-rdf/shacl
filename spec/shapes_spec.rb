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
    RDF::OrderedRepo.new do |r|
      r << RDF::Turtle::Reader.new(src)
    end
  end

  def parse_shapes(src, **options)
    g = parse_ttl(src)
    SHACL::Shapes.from_graph(g, **options)
  end
end
