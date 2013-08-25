# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli/version'

Gem::Specification.new do |spec|
  spec.name          = "cli"
  spec.version       = Cli::VERSION
  spec.authors       = ["Jeff Taggart", "Mark Burns"]
  spec.email         = ["jeff@jetaggart.com", "markthedeveloper@gmail.com"]
  spec.summary       = "CLI interface for meil"
  spec.homepage      = "http://meil.io"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.18.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
