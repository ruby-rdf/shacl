require "bundler/setup"
require 'rdf/spec'
require 'rdf/spec/matchers'
require 'matchers'
require 'rdf/turtle'
require 'rdf/ordered_repo'
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start do
  add_filter "/spec/"
end

require 'shacl'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
