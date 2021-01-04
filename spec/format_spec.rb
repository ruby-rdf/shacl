# coding: utf-8
$:.unshift "."
require 'spec_helper'
require 'rdf/spec/format'

describe SHACL::Format do
  it_behaves_like 'an RDF::Format' do
    let(:format_class) {SHACL::Format}
  end

  describe ".for" do
    [
      :shacl,
    ].each do |arg|
      it "discovers with #{arg.inspect}" do
        expect(RDF::Format.for(arg)).to eq described_class
      end
    end
  end

  describe "#to_sym" do
    specify {expect(described_class.to_sym).to eq :shacl}
  end

  describe ".cli_commands" do
    require 'rdf/cli'
    let(:ttl) {File.expand_path("../../etc/doap.ttl", __FILE__)}
    let(:shapes) {File.expand_path("../../etc/doap-shacl.ttl", __FILE__)}
    let(:shapes_input) {File.read(shapes)}
    let(:messages) {Hash.new}

    describe "#shacl" do
      it "matches from file" do
        expect {RDF::CLI.exec(["shacl", ttl], shapes: shapes, messages: messages)}.not_to write.to(:output)
        expect(messages).not_to be_empty
      end
      it "patches from StringIO" do
        expect {RDF::CLI.exec(["shacl", ttl], shapes: StringIO.new(shapes_input), messages: messages)}.not_to write.to(:output)
        expect(messages).not_to be_empty
      end
    end
  end
end
