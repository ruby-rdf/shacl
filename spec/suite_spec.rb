require_relative 'spec_helper'
require_relative 'entailment'

describe SHACL do
  # W3C Test suite from https://w3c.github.io/data-shapes/data-shapes-test-suite/tests/core/node
  describe "w3c node tests" do
    let(:logger) {RDF::Spec.logger}

    require_relative 'suite_helper'

    %w(
      core/node
      core/property
      core/targets
      core/misc
      core/path
      core/complex
      core/validation-reports
      sparql/node
      sparql/property
      sparql/pre-binding
    ).each do |path|
      Fixtures::SuiteTest::Manifest.open("urn:x-shacl-test:/#{path}/manifest.ttl") do |m|
        describe m.label do
          m.entries.each do |t|
            next unless t.status == 'sht:approved'
            rel = t.id.sub('urn:x-shacl-test:/', '')
            specify "#{rel}: #{t.label}" do
              case rel
              when *%w{core/property/uniqueLang-002}
                pending "non-strict boolean property values"
              when *%w{core/node/minInclusive-003}
                pending "comparison of dates and times with and without timezone"
              when *%w{core/property/qualifiedMinCountDisjoint-001 core/property/qualifiedValueShapesDisjoint-001}
                pending "sh:qualifiedValueShapesDisjoint"
              when *%w{core/path/path-strange-001 core/path/path-strange-002}
                pending "unparsable path"
              when *%w{core/property/property-001 core/validation-reports/shared}
                pending "maintaining focus"
              when *%w{core/complex/shacl-shacl}
                skip "Until later"
              when %r(^sparql/pre-binding/unsupported-sparql)
                skip "Raises errors, as expected"
              end

              t.logger = logger
              t.logger.info t.inspect
              t.logger.info "dataGraph:\n#{t.dataGraphInput}"
              t.logger.info "shapesGraph:\n#{t.shapesGraphInput}"

              shapes = SHACL.open(t.shapesGraph, logger: t.logger)
              t.logger.info "shape JSON:\n#{shapes.shape_json.to_json(JSON::LD::JSON_STATE)}"
              t.logger.info "shapes SXP:\n#{SXP::Generator.string(shapes.to_sxp_bin)}"

              # Consider that the datagraph defines a vocabulary
              t.dataGraph.extend(SHACL::Entailment)
              t.dataGraph.entail!

              report = shapes.execute(t.dataGraph, logger: t.logger)
              t.logger.info "report: #{SXP::Generator.string report.to_sxp_bin}"

              if t.positive_test?
                expect(report.conform?).to produce(true, t.logger)
              else
                expect(report.conform?).to produce(false, t.logger)
                # Verify that the produced results are the same
                if t.report
                  expect(report.results.count).to produce(t.report.results.count, t.logger)
                  expect(report).to produce(t.report, t.logger)
                end
                expect(RDF::Graph.new << report).to be_a(RDF::Enumerable)
              end
            end
          end
        end
      end
    end
  end
end