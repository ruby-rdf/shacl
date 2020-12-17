require_relative 'algebra'
require_relative 'validation_result'
require_relative 'context'
require 'json/ld'

module SHACL
  ##
  # The set of shapes loaded from a graph.
  class Shapes < Array
    include RDF::Util::Logger

    # The graphs which have been loaded as shapes
    #
    # @return [Array<RDF::URI>]
    attr_reader :loaded_graphs

    # The framed shapes
    #
    # @return [Array<Object>]
    attr_reader :loaded_shapes

    # The JSON used to instantiate shapes
    #
    # @return [Array<Hash>]
    attr_reader :shape_json

    ##
    # Initializes the shapes from `graph`loading `owl:imports` until all references are loaded.
    #
    # The shapes come from the following:
    # * Instances of `sh:NodeShape` or `sh:PropertyShape`
    # * resources that have any of the properties `sh:targetClass`, `sh:targetNode`, `sh:targetObjectsOf`, or `sh:targetSubjectsOf`.
    #
    # @param [RDF::Graph] graph
    # @param [Array<RDF::URI>] loaded_graphs = []
    # @param [Hash{Symbol => Object}] options
    # @return [Shapes]
    # @raise [SHACL::Error]
    def self.from_graph(graph, loaded_graphs: [], **options)
      @loded_graphs = loaded_graphs

      import_count = 0
      while (imports = graph.query(predicate: RDF::OWL.imports).map(&:object)).count > import_count
        # Load each imported graph
        imports.each do |ref|
          graph.load(imports)
          loaded_graphs << ref
          import_count += 1
        end
      end

      # Serialize the graph as framed JSON-LD and initialize patterns, recursively.
      shape_json = JSON::LD::API.fromRdf(graph, useNativeTypes: true) do |expanded|
        JSON::LD::API.frame(expanded, SHAPES_FRAME, omitGraph: false, embed: '@always', expanded: true)
      end['@graph']

      # Create an array of the framed shapes
      shapes = self.new(shape_json.map {|o| Algebra.from_json(o, **options)})
      shapes.instance_variable_set(:@shape_json, shape_json)
      shapes
    end

    ##
    # Match on schema. Finds appropriate shape for node, and matches that shape.
    #
    # @param [RDF::Queryable] graph
    # @return [Hash{RDF::Term => Array<ValidationResult>}] Returns _ValidationResults_, a hash of focus nodes to the results of their associated shapes
    # @param [Hash{Symbol => Object}] options
    # @option options [RDF::Term] :focus
    #   An explicit focus node, overriding any defined on the top-level shaps.
    # @return [Array<SHACL::ValidationResult]
    def execute(graph, depth: 0, **options)
      self.each do |shape|
        shape.graph = graph
        shape.each_descendant do |op|
          op.graph = graph
        end
      end

      # Execute all shapes against their target nodes
      self.map do |shape|
        nodes = Array(options.fetch(:focus, shape.targetNodes))
        nodes.map do |node|
          shape.conforms(node, depth: depth + 1)
        end
      end.flatten
    end

    def to_sxp_bin
      [:shapes, super]
    end

    def to_sxp
      to_sxp_bin.to_sxp
    end

    SHAPES_FRAME = JSON.parse(%({
      "@context": {
        "id": "@id",
        "type": {"@id": "@type", "@container": "@set"},
        "@vocab": "http://www.w3.org/ns/shacl#",
        "and": {"@type": "@id", "@container": "@list"},
        "annotationProperty": {"@type": "@id"},
        "class": {"@type": "@id"},
        "comment": "http://www.w3.org/2000/01/rdf-schema#comment",
        "condition": {"@type": "@id"},
        "datatype": {"@type": "@vocab"},
        "declare": {"@type": "@id"},
        "disjoint": {"@type": "@id"},
        "disjoint": {"@type": "@id"},
        "entailment": {"@type": "@id"},
        "equals": {"@type": "@id"},
        "ignoredProperties": {"@type": "@id", "@container": "@list"},
        "inversePath": {"@type": "@id"},
        "label": "http://www.w3.org/2000/01/rdf-schema#label",
        "languageIn": {"@container": "@list"},
        "lessThan": {"@type": "@id"},
        "lessThanOrEquals": {"@type": "@id"},
        "nodeKind": {"@type": "@vocab"},
        "or": {"@type": "@id", "@container": "@list"},
        "path": {"@type": "@none"},
        "property": {"@type": "@id"},
        "severity": {"@type": "@vocab"},
        "targetClass": {"@type": "@id"},
        "targetNode": {"@type": "@none"}
      },
      "@type": ["NodeShape", "PropertyShape"],
      "property": {},
      "targetClass": {},
      "targetNode": {},
      "targetObjectsOf": {},
      "targetSubjectsOf": {}
    })).freeze
  end
end
