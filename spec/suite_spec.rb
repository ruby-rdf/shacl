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
    ).each do |path|
      Fixtures::SuiteTest::Manifest.open("urn:x-shacl-test:/#{path}/manifest.ttl") do |m|
        describe m.label do
          m.entries.each do |t|
            next unless t.status == 'sht:approved'
            rel = t.id.sub('urn:x-shacl-test:/', '')
            specify "#{rel}: #{t.label}" do
              case rel
              when *%w{core/node/closed-001 core/node/closed-002}
                pending "Closed nodes."
              when *%w{core/misc/severity-002}
                pending "Custom severity."
              when *%w{core/property/uniqueLang-002}
                pending "non-strict boolean property values"
              when *%w{core/targets/targetClassImplicit-001}
                pending "inferred classes in data"
              when *%w{core/complex/shacl-shacl}
                skip "Until later"
              end

              t.logger = logger
              t.logger.info t.inspect
              t.logger.info "dataGraph:\n#{t.dataGraphInput}"
              t.logger.info "shapesGraph:\n#{t.shapesGraphInput}"

              shapes = SHACL.get_shapes(t.shapesGraph, logger: t.logger)
              t.logger.info "shape JSON:\n#{shapes.shape_json.to_json(JSON::LD::JSON_STATE)}"
              t.logger.info "shapes SXP:\n#{SXP::Generator.string(shapes.to_sxp_bin)}"

              # Consider that the datagraph defines a vocabulary
              t.dataGraph.extend(SHACL::Entailment)
              t.dataGraph.entail!

              results = shapes.execute(t.dataGraph, logger: t.logger)
              t.logger.info "results: #{SXP::Generator.string results.reject(&:conform?).to_sxp_bin}"

              conforms = results.all?(&:conform?)
              if t.positive_test?
                expect(conforms).to produce(true, t.logger)
              else
                expect(conforms).to produce(false, t.logger)
                # Verify that the produced results are the same
                expected_results = t.results
                actual_results = results.reject(&:conform?)
                expect(actual_results.count).to produce(expected_results.count, t.logger)
                expect(actual_results).to include(*expected_results), t.logger.to_s
              end
            end
          end
        end
      end
    end
  end
end unless ENV['CI']