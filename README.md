# SHACL: Shapes Constraint Language (SHACL) for Ruby

This is a pure-Ruby library for working with the [Shape Constraint Language][SHACL Spec] to validate the shape of [RDF][] graphs.

[![Gem Version](https://badge.fury.io/rb/shacl.png)](https://badge.fury.io/rb/shacl)
[![Build Status](https://github.com/ruby-rdf/shacl/workflows/CI/badge.svg?branch=develop)](https://github.com/ruby-rdf/shacl/actions?query=workflow%3ACI)
[![Coverage Status](https://coveralls.io/repos/ruby-rdf/shacl/badge.svg)](https://coveralls.io/github/ruby-rdf/shacl)
[![Gitter chat](https://badges.gitter.im/ruby-rdf/rdf.png)](https://gitter.im/ruby-rdf/rdf)

## Features

* 100% pure Ruby with minimal dependencies and no bloat.
* Fully compatible with [SHACL][SHACL Spec] specifications.
* 100% free and unencumbered [public domain](https://unlicense.org/) software.

[Implementation Report](https://ruby-rdf.github.io/shacl/etc/earl.html)

Install with `gem install shacl`

## Description

The SHACL gem implements a [SHACL][SHACL Spec] Shape Expression engine.

## Examples

    require 'linkeddata'
    require 'shacl'

    graph = RDF::Graph.load("etc/doap.ttl")
    shacl = SHACL.open("etc/doap.shacl")
    report = shacl.execute(graph)
    #=> ValidationReport(conform?, results*)

## Command Line
TODO: When the `linkeddata` gem is installed, RDF.rb includes a `rdf` executable which acts as a wrapper to perform a number of different
operations on RDF files, including SHACL. The commands specific to SHACL is 

## Documentation

<https://rubydoc.info/github/ruby-rdf/shacl>

## Implementation Notes

Similar to the [ShEx gem][] and to the general strategy for querying graphs in the [SPARQL gem][], the strategy is to parse SHACL shapes into executable operators, which are called recursively to create result sets corresponding to matched nodes and properties.

The shape graph is parsed into JSON-LD, and then converted into [S-Expressions][], which match the execution path. These [S-Expressions][] can be parsed to recreate the executable shape constraints.

Evaluating the shapes against a graph results in a {SHACL::ValidationReport} indicating conformance, along with a set of individual {SHACL::ValidationResult} instances.

The resulting validation report can be compared with other validation reports, used as native Ruby objects, serialized to s-expressions, or used as an RDF::Enumerable to retrieve the RDF representation of the report, as defined in [SHACL Spec][].

### Matching Entailed Triples
Many tests check for entailed triples, such as entailed super-classes of explict `rdf:type` values. If this is required for a given application, the [RDF::Reasoner][] gem can be used to create such entailed triples.

    require 'shacl'
    require 'rdf/reasoner'
    RDF::Reasoner.apply(:rdfs)
    graph = RDF::Graph.load("etc/doap.ttl")
    graph.entail!
    shacl = SHACL.open("etc/doap.shacl")
    results = shacl.execute(graph)
    #=> [ValidationResult, ...]
    

## Dependencies

* [Ruby](https://ruby-lang.org/) (>= 2.4)
* [RDF.rb](https://rubygems.org/gems/rdf) (~> 3.1, => 3.1.8)
* [SPARQL](https://rubygems.org/gems/sparql) (~> 3.1, => 3.1.4)
* [json-ld](https://rubygems.org/gems/sparql) (~> 3.1, => 3.1.7)
* [sxp](https://rubygems.org/gems/sxp) (~> 1.1)

## Installation

The recommended installation method is via [RubyGems](https://rubygems.org/).
To install the latest official release of RDF.rb, do:

    % [sudo] gem install shacl

## Download

To get a local working copy of the development repository, do:

    % git clone git://github.com/ruby-rdf/shacl.git

Alternatively, download the latest development version as a tarball as
follows:

    % wget https://github.com/ruby-rdf/shacl/tarball/master

## Resources

* <https://rubydoc.info/github/ruby-rdf/shacl>
* <https://github.com/ruby-rdf/shacl>
* <https://rubygems.org/gems/shacl>

## Mailing List

* <https://lists.w3.org/Archives/Public/public-rdf-ruby/>

## Author

* [Gregg Kellogg](https://github.com/gkellogg) - <https://greggkellogg.net/>

## Contributing

This repository uses [Git Flow](https://github.com/nvie/gitflow) to mange development and release activity. All submissions _must_ be on a feature branch based on the _develop_ branch to ease staging and integration.

* Do your best to adhere to the existing coding conventions and idioms.
* Don't use hard tabs, and don't leave trailing whitespace on any line.
  Before committing, run `git diff --check` to make sure of this.
* Do document every method you add using [YARD][] annotations. Read the
  [tutorial][YARD-GS] or just look at the existing code for examples.
* Don't touch the `.gemspec` or `VERSION` files. If you need to change them,
  do so on your private branch only.
* Do feel free to add yourself to the `CREDITS` file and the
  corresponding list in the the `README`. Alphabetical order applies.
* Don't touch the `AUTHORS` file. If your contributions are significant
  enough, be assured we will eventually add you in there.
* Do note that in order for us to merge any non-trivial changes (as a rule
  of thumb, additions larger than about 15 lines of code), we need an
  explicit [public domain dedication][PDD] on record from you,
  which you will be asked to agree to on the first commit to a repo within the organization.
  Note that the agreement applies to all repos in the [Ruby RDF](https://github.com/ruby-rdf/) organization.

## License

This is free and unencumbered public domain software. For more information,
see <https://unlicense.org/> or the accompanying {file:LICENSE} file.

[RDF]:           https://www.w3.org/RDF/
[YARD]:          https://yardoc.org/
[YARD-GS]:       https://rubydoc.info/docs/yard/file/docs/GettingStarted.md
[PDD]:           https://unlicense.org/#unlicensing-contributions
[S-Expressions]: https://en.wikipedia.org/wiki/S-expression
[RDF.rb]:        https://ruby-rdf.github.com/rdf
[RDF::Reasoner]:        https://ruby-rdf.github.com/rdf-reasoner
[SPARQL gem]:    https://ruby-rdf.github.com/sparql
[SXP gem]:       https://ruby-rdf.github.com/sxp
[SHACL Spec]:    https://www.w3.org/TR/shacl/
[ShEx gem]:      https://ruby-rdf.github.com/shex
