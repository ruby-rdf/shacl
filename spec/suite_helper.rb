require 'rdf/spec'
require 'rdf/turtle'
require 'json/ld'

# For now, override RDF::Utils::File.open_file to look for the file locally before attempting to retrieve it
module RDF::Util
  module File
    REMOTE_PATH = "urn:x-shacl-test:/"
    LOCAL_PATH = ::File.expand_path("../w3c-data-shapes/data-shapes-test-suite/tests", __FILE__) + '/'

    class << self
      alias_method :original_open_file, :open_file
    end

    ##
    # Override to use Patron for http and https, Kernel.open otherwise.
    #
    # @param [String] filename_or_url to open
    # @param  [Hash{Symbol => Object}] options
    # @option options [Array, String] :headers
    #   HTTP Request headers.
    # @return [IO] File stream
    # @yield [IO] File stream
    def self.open_file(filename_or_url, **options, &block)
      case 
      when filename_or_url.to_s =~ /^file:/
        path = filename_or_url[5..-1]
        Kernel.open(path.to_s, options, &block)
      when (filename_or_url.to_s =~ %r{^#{REMOTE_PATH}} && Dir.exist?(LOCAL_PATH))
        #puts "attempt to open #{filename_or_url} locally"
        localpath = filename_or_url.to_s.sub(REMOTE_PATH, LOCAL_PATH)
        response = begin
          ::File.open(localpath)
        rescue Errno::ENOENT => e
          raise IOError, e.message
        end
        document_options = {
          base_uri:     RDF::URI(filename_or_url),
          charset:      Encoding::UTF_8,
          code:         200,
          headers:      {}
        }
        #puts "use #{filename_or_url} locally"
        document_options[:headers][:content_type] = case filename_or_url.to_s
        when /\.ttl$/    then 'text/turtle'
        when /\.nt$/     then 'application/n-triples'
        when /\.jsonld$/ then 'application/ld+json'
        else                  'unknown'
        end

        document_options[:headers][:content_type] = response.content_type if response.respond_to?(:content_type)
        # For overriding content type from test data
        document_options[:headers][:content_type] = options[:contentType] if options[:contentType]

        remote_document = RDF::Util::File::RemoteDocument.new(response.read, document_options)
        if block_given?
          yield remote_document
        else
          remote_document
        end
      else
        original_open_file(filename_or_url, **options, &block)
      end
    end
  end
end

module Fixtures
  module SuiteTest
    class Manifest < JSON::LD::Resource
      FRAME = JSON.parse(%q({
        "@context": {
          "xsd": "http://www.w3.org/2001/XMLSchema#",
          "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
          "mf": "http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#",
          "sh": "http://www.w3.org/ns/shacl#",
          "sht": "http://www.w3.org/ns/shacl-test#",
          "action": {"@id": "mf:action", "@type": "@id"},
          "approval": {"@id": "rdft:approval", "@type": "@vocab"},
          "comment": "rdfs:comment",
          "conclusions": {"@id": "test:conclusions", "@type": "xsd:boolean"},
          "sourceConstraintComponent": "sh:sourceConstraintComponent",
          "dataGraph": {"@id": "sht:dataGraph", "@type": "@id"},
          "name": "mf:name",
          "label": "rdfs:label",
          "entries": {"@id": "mf:entries", "@container": "@list", "@type": "@id"},
          "filter": {"@id": "test:filter", "@type": "@id"},
          "focusNode": "sh:focusNode",
          "details": "rdfs:details",
          "name": "mf:name",
          "message": "sh:message",
          "options": {"@id": "test:options", "@type": "@id"},
          "result": {"@id":"mf:result", "@type": "@id"},
          "resultPath": "sh:resultPath",
          "resultSeverity": "sh:resultSeverity",
          "shapesGraph": {"@id": "sht:shapesGraph", "@type": "@id"},
          "sourceShape": "sh:sourceShape",
          "status": {"@id": "mf:status", "@type": "@id"},
          "value": "sh:value"
        },
        "@type": "mf:Manifest",
        "entries": {}
      }))

      def self.open(file)
        # Open file, and add all tests reference from mf:include
        #puts "open: #{file}"
        @file = file

        g = RDF::OrderedRepo.load(file)
        label = g.first_object(predicate: RDF::RDFS.label).to_s

        g.query(predicate: RDF::URI("http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#include")).objects.each do |f|
          g.load(f)
        end
        JSON::LD::API.fromRDF(g, useNativeTypes: true) do |expanded|
          # Consolodate to a single Manifest entry with all entries merged.
          manifests = expanded.select {|o| Array(o['@type']).include?("http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#Manifest")}
          expanded = expanded - manifests
          entries = manifests.
            map do |m|
              Array(m.fetch("http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#entries", [{}]).first["@list"])
            end.flatten.
            sort_by {|e| e['@id']}

          label = manifests.map {|m| m[RDF::RDFS.label.to_s]}.flatten.compact.first.fetch('@value', '')

          # Add Manifest back
          expanded << {
            "@id" => file,
            "@type" => "http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#Manifest",
            RDF::RDFS.label.to_s => label,
            "http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#entries" => {
              "@list" => entries
            }
          }
          JSON::LD::API.frame(expanded, FRAME) do |framed|
            yield Manifest.new(framed)
          end
        end
      end

      def entries
        # Map entries to resources
        ents = attributes['entries'].map {|e| Entry.new(e, context: context)}
        ents
      end
    end

    class Entry < JSON::LD::Resource
      attr_accessor :debug

      def initialize(node_definition, **options)
        super
      end

      def dataGraphInput
        RDF::Util::File.open_file(action['dataGraph']).read
      end

      def dataGraph
        @dataGraph ||= RDF::OrderedRepo.load(action['dataGraph'])
      end

      def shapesGraphInput
        RDF::Util::File.open_file(action['shapesGraph']).read
      end

      def shapesGraph
        @shapesGraph ||= RDF::OrderedRepo.load(action['shapesGraph']) if action['shapesGraph']
      end

      def report
        SHACL::ValidationReport.new(results)
      end

      def results
        res = result['sh:result']
        res = [res] unless res.is_a?(Array)
        res.map {|r| SHACL::ValidationResult.from_json(r, logger: logger)}.uniq if result['sh:result']
      end

      def positive_test?
        result['sh:conforms']
      end

      def negative_test?
        !result['sh:conforms']
      end

      # Create a logger initialized with the content of `debug`
      def logger
        @logger ||= begin
          l = RDF::Spec.logger
          (debug || []).each {|d| l.debug(d)}
          l
        end
      end

      def inspect
        "<Entry\n" + attributes.map do |k,v|
          if k == 'result'
            SXP::Generator.string(report.to_sxp_bin).gsub(/^/m, '  ')
          else
            case v when Hash
              "  #{k}: {\n" + v.map {|ak, av| "    #{ak}: #{av.inspect}"}.join(",\n") + "\n  }"
            else
              " #{k}: #{v.inspect}"
            end
          end
        end.join("  \n") + ">"
      end
    end
  end
end