#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'shacl'
  gem.homepage           = 'https://ruby-rdf.github.com/shacl'
  gem.license            = 'Unlicense'
  gem.summary            = 'Implementation of Shapes Constraint Language (SHACL) for RDF.rb'
  gem.description        = 'SHACL is an Shape Constraint engine for the Ruby RDF.rb library suite.'

  gem.authors            = ['Gregg Kellogg']
  gem.email              = 'public-rdf-ruby@w3.org'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(README.md LICENSE VERSION etc/doap.ttl) + Dir.glob('lib/**/*.rb')
  gem.require_paths      = %w(lib)

  gem.required_ruby_version      = '>= 2.4'
  gem.requirements               = []
  gem.add_runtime_dependency     'rdf',         '~> 3.1', '>= 3.1.8'
  gem.add_runtime_dependency     'json-ld',     '~> 3.1', '>= 3.1.7'
  gem.add_runtime_dependency     'sxp',         '~> 1.1'
  gem.add_runtime_dependency     'sparql',      '~> 3.1'

  gem.add_development_dependency 'rdf-spec',    '~> 3.1'
  gem.add_development_dependency 'rdf-turtle',  '~> 3.1'
  gem.add_development_dependency 'rdf-xsd',     '~> 3.1'
  gem.add_development_dependency 'rspec',       '~> 3.10'
  gem.add_development_dependency 'rspec-its',   '~> 1.3'
  gem.add_development_dependency 'yard',        '~> 0.9'

  gem.post_install_message       = nil
end
