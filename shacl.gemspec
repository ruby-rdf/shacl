#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'shacl'
  gem.homepage           = 'https://github.com/ruby-rdf/shacl'
  gem.license            = 'Unlicense'
  gem.summary            = 'Implementation of Shapes Constraint Language (SHACL) for RDF.rb'
  gem.description        = 'SHACL is an Shape Constraint engine for the Ruby RDF.rb library suite.'
  gem.metadata           = {
    "documentation_uri" => "https://ruby-rdf.github.io/shacl",
    "bug_tracker_uri"   => "https://github.com/ruby-rdf/shacl/issues",
    "homepage_uri"      => "https://github.com/ruby-rdf/shacl",
    "mailing_list_uri"  => "https://lists.w3.org/Archives/Public/public-rdf-ruby/",
    "source_code_uri"   => "https://github.com/ruby-rdf/shacl",
  }

  gem.authors            = ['Gregg Kellogg']
  gem.email              = 'public-rdf-ruby@w3.org'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(README.md LICENSE VERSION etc/doap.ttl) + Dir.glob('lib/**/*.rb')
  gem.require_paths      = %w(lib)

  gem.required_ruby_version      = '>= 3.0'
  gem.requirements               = []
  gem.add_runtime_dependency     'rdf',         '~> 3.3'
  gem.add_runtime_dependency     'json-ld',     '~> 3.3'
  gem.add_runtime_dependency     'sxp',         '~> 2.0'
  gem.add_runtime_dependency     'sparql',      '~> 3.3'

  gem.add_development_dependency 'getoptlong',  '~> 0.2'
  gem.add_development_dependency 'rdf-spec',    '~> 3.3'
  gem.add_development_dependency 'rdf-turtle',  '~> 3.3'
  gem.add_development_dependency 'rdf-vocab',   '~> 3.3'
  gem.add_development_dependency 'rdf-xsd',     '~> 3.3'
  gem.add_development_dependency 'rspec',       '~> 3.13'
  gem.add_development_dependency 'rspec-its',   '~> 1.3'
  gem.add_development_dependency 'yard',        '~> 0.9'

  gem.post_install_message       = nil
end
