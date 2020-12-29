source 'https://rubygems.org'

gemspec

gem 'rdf',
    git: 'https://github.com/ruby-rdf/rdf.git',
    branch: 'develop'

group :development, :test do
  gem 'json-ld',            git: 'https://github.com/ruby-rdf/json-ld.git',             branch: 'develop'
  gem 'rdf-isomorphic',     git: 'https://github.com/ruby-rdf/rdf-isomorphic.git',      branch: 'develop'
  gem 'rdf-ordered-repo',   git: 'https://github.com/ruby-rdf/rdf-ordered-repo.git',    branch: 'develop'
  gem 'rdf-reasoner',       git: 'https://github.com/ruby-rdf/rdf-reasoner.git',        branch: 'develop'
  gem 'rdf-spec',           git: 'https://github.com/ruby-rdf/rdf-spec.git',            branch: 'develop'
  gem 'rdf-turtle',         git: 'https://github.com/ruby-rdf/rdf-turtle.git',          branch: 'develop'
  gem 'rdf-xsd',            git: 'https://github.com/ruby-rdf/rdf-xsd.git',             branch: 'develop'
  gem 'sparql',             git: 'https://github.com/ruby-rdf/sparql.git',              branch: 'develop'
  gem 'sxp',                git: 'https://github.com/dryruby/sxp.rb.git',               branch: 'develop'

  gem 'rake'
  gem 'simplecov',      '~> 0.16', platforms: :mri
  gem 'coveralls',      '~> 0.8', '>= 0.8.23',  platforms: :mri
end

group :debug do
  gem 'byebug', platform: :mri
end
