#!/usr/bin/env ruby

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
  cmd += " -o lib/rdf/vocab/shacl.rb_t"
  cmd += " https://www.w3.org/ns/shacl.ttl"
  puts "  #{cmd}"
  begin
    %x{#{cmd} && sed 's/\r//g' lib/rdf/vocab/shacl.rb_t > lib/rdf/vocab/shacl.rb}
  rescue
    puts "Failed to load shacl vocabulary: #{$!.message}"
  ensure
    %x{rm -f lib/rdf/vocab/shacl.rb_t}
  end
end

desc "Build cached context for interpreting IRIs from JSON representation"
task context: "lib/shacl/context.rb"

file "lib/shacl/context.rb" => "lib/shacl/shapes.rb" do
  File.open("lib/shacl/context.rb", "w") do |f|
    require 'json/ld'
    require 'shacl'
    c = JSON::LD::Context.parse(SHACL::Shapes::SHAPES_FRAME['@context'])
    c.context_base = "http://github.com/ruby-rdf/shacl/"
    f.write c.to_rb
  end
end

file 'etc/manifests.ttl' do
  %x{script/tc --write-manifests -o etc/manifests.ttl}
end

desc "Generate EARL report"
task :earl => 'etc/earl.html'

file 'etc/earl.ttl' => 'etc/doap.ttl' do
  %x{script/tc --earl -o etc/earl.ttl}
end

file 'etc/earl.jsonld' => %w(etc/earl.ttl etc/manifests.ttl etc/template.haml) do
  %x{(cd etc; earl-report --format json -o earl.jsonld earl.ttl)}
end

file 'etc/earl.html' => 'etc/earl.jsonld' do
  %x{(cd etc; earl-report --json --format html --template template.haml -o earl.html earl.jsonld)}
end
