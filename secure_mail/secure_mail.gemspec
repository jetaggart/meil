# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secure_mail/version'

Gem::Specification.new do |spec|
  spec.name          = "secure_mail"
  spec.version       = SecureMail::VERSION
  spec.authors       = ["Jeff Taggart", "Mark Burns"]
  spec.email         = ["jeff@jetaggart.com", "markthedeveloper@gmail.com"]
  spec.homepage      = "http://meil.io"
  spec.license       = "MIT"
  spec.summary       = "This is the lib to send secure mail"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency  "activesupport", "~> 3.2.13"
  spec.add_dependency  "activerecord",  "~> 3.2.13"
  spec.add_dependency  "virtus",        "~> 0.5.5"

  spec.add_development_dependency "debugger", "~> 1.6.0"
  spec.add_development_dependency "sqlite3",  "~> 1.3.7"
  spec.add_development_dependency "bundler",  "~> 1.3"
  spec.add_development_dependency "rake",     "~> 10.1.0"
  spec.add_development_dependency "rspec",    "~> 2.14.1"
end
