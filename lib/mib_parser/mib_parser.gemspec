# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mib_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "mib_parser"
  spec.version       = MIBParser::VERSION
  spec.authors       = ["Hirokazu BANNO"]
  spec.email         = ["hirokazu.banno@brother.co.jp"]
  spec.summary       = %q{A Ruby implementation of MIB parser.}
  spec.files         = Dir['{lib,bin}/**/*', 'Gemfile', 'README.md', 'Rakefile', 'mib_parser.gemspec']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end
