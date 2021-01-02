require_relative "spec_helper"

describe SHACL do
  describe ".get_shapes" do
    it "gets shapes from graph" do
      g = RDF::Graph.new
      expect(SHACL::Shapes).to receive(:from_graph).with(g, any_args)
      SHACL.get_shapes(g)
    end
  end

  describe ".open" do
    it "opens shapes graph and gets shapes" do
      g = RDF::Graph.new
      expect(RDF::Graph).to receive(:load).with("http://example.org/shapes_graph", any_args).and_yield(g)
      expect(SHACL).to receive(:get_shapes).with(g, loaded_graphs: [RDF::URI("http://example.org/shapes_graph")])
      SHACL.open("http://example.org/shapes_graph")
    end
  end

  describe ".from_queryable" do
    it "gets shapes from queryable" do
      g = RDF::Graph.new
      expect(SHACL::Shapes).to receive(:from_queryable).with(g, any_args)
      SHACL.from_queryable(g)
    end
  end

  describe ".execute" do
    it "opens input and queries against queryable" do
      g = RDF::Graph.new
      shapes = double(:shapes)
      expect(SHACL).to receive(:open).with("http://example.org/shapes_graph", any_args).and_return(shapes)
      expect(shapes).to receive(:execute).with(g, any_args)
      SHACL.execute("http://example.org/shapes_graph", g)
    end

    it "opens input and queries against an empty graph" do
      shapes = double(:shapes)
      expect(SHACL).to receive(:open).with("http://example.org/shapes_graph", any_args).and_return(shapes)
      expect(shapes).to receive(:execute).with(RDF::Graph, any_args)
      SHACL.execute("http://example.org/shapes_graph")
    end
  end
end
