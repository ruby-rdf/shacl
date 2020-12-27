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
              rdfs:label "Node" ;
              .
          ),
          sxp: %{(shapes (
            (NodeShape
              (id <http://example.org/nodeNode>)
              (type shacl:NodeShape rdfs:Class)
              (label "Node")
            ))
          )},
          data: {
            "node with type matching shape": {
              input: %(
                @prefix ex: <http://example.org/node> .
                @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
                @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

                ex:Target rdf:type ex:Node;
                  rdfs:label "Target Node" .
              ),
              valid: true,
              sxp: %{()}
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
                  expect(report).to all(be_conform)
                end
              else
                it "does not conform" do
                  expect(report).not_to all(be_conform)
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
