#!/usr/bin/env ruby
require 'rdf/vocab'
require 'rdf/turtle'

namespace :gem do
  desc "Build the shacl-#{File.read('VERSION').chomp}.gem file"
  task :build do
    sh "gem build shacl.gemspec && mv shacl-#{File.read('VERSION').chomp}.gem pkg/"
  end

  desc "Release the shacl-#{File.read('VERSION').chomp}.gem file"
  task :release do
    sh "gem push pkg/shacl-#{File.read('VERSION').chomp}.gem"
  end
end

desc "Generate SHACL vocabulary class"
task :vocab do
  puts "Generate lib/shacl/vocab.rb"
  cmd = "bundle exec rdf"
  cmd += " serialize --uri 'http://www.w3.org/ns/shacl#' --output-format vocabulary --ordered"
  cmd += " --module-name RDF::Vocab"
  cmd += " --class-name SHACL"
  cmd += " --strict" 
  cmd += " -o lib/shacl/vocab.rb_t"
  cmd += " https://www.w3.org/ns/shacl.ttl"
  puts "  #{cmd}"
  begin
    %x{#{cmd} && sed 's/\r//g' lib/shacl/vocab.rb_t > lib/shacl/vocab.rb}
  rescue
    puts "Failed to load shacl vocabulary: #{$!.message}"
  ensure
    %x{rm -f lib/shacl/vocab.rb_t}
  end
end
