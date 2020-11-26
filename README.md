# SHACL: Shapes Constraint Language (SHACL) for Ruby

This is a pure-Ruby library for working with the [Shape Constraint Language][SHACL Spec] to validate the shape of [RDF][] graphs.

<https://ruby-rdf.github.com/shacl>

[![Gem Version](https://badge.fury.io/rb/shacl.png)](https://badge.fury.io/rb/shacl)
[![Build Status](https://travis-ci.org/ruby-rdf/shacl.png?branch=master)](https://travis-ci.org/ruby-rdf/shacl)
[![Coverage Status](https://coveralls.io/repos/ruby-rdf/shacl/badge.svg)](https://coveralls.io/r/ruby-rdf/shacl)
[![Join the chat at https://gitter.im/ruby-rdf/rdf](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ruby-rdf/rdf?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Features

* 100% pure Ruby with minimal dependencies and no bloat.
* Fully compatible with [SHACL][SHACL Spec] specifications.
* 100% free and unencumbered [public domain](https://unlicense.org/) software.

## Description

The SHACL gem implements a [SHACL][SHACL Spec] Shape Expression engine.

### Implementation Strategy

Similar to the [ShEx gem][] and to the general strategy for querying graphs in the [SPARQL gem][], the strategy is to parse SHACL shapes into executable operators, which are called recursively to create result sets corresponding to matched nodes and properties.

The parsed shapes can be serialized as [S-Expressions][], which match the execution path. These [S-Expressions][] can be parsed to recreate the executable shape constraints.

## Examples

## Command Line
When the `linkeddata` gem is installed, RDF.rb includes a `rdf` executable which acts as a wrapper to perform a number of different
operations on RDF files, including ShEx. The commands specific to ShEx is 

## Documentation

<https://rubydoc.info/github/ruby-rdf/shacl>

## Implementation Notes

## Dependencies

* [Ruby](https://ruby-lang.org/) (>= 2.4)
* [RDF.rb](https://rubygems.org/gems/rdf) (~> 3.1)

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

[SHACL Spec]:    https://www.w3.org/TR/shacl/
[RDF]:           https://www.w3.org/RDF/
[YARD]:          https://yardoc.org/
[YARD-GS]:       https://rubydoc.info/docs/yard/file/docs/GettingStarted.md
[PDD]:           https://unlicense.org/#unlicensing-contributions
[S-Expressions]: https://en.wikipedia.org/wiki/S-expression
[RDF.rb]:        https://rubydoc.info/github/ruby-rdf/rdf
[SPARQL gem]:    https://ruby-rdf.github.com/sparql
[SXP gem]:       https://ruby-rdf.github.com/sxp
[ShEx gem]:      https://ruby-rdf.github.com/shex
