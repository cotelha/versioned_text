# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'versioned_text/version'

Gem::Specification.new do |spec|
  spec.name          = "versioned_text"
  spec.version       = VersionedText::VERSION
  spec.authors       = ["Guilherme Kuhn"]
  spec.email         = ["g.kuhn0@gmail.com"]
  spec.summary       = %q{Model VersionedText para controlar campos texto com versões}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry', '~> 0.9.12.6'

  spec.add_runtime_dependency 'acts_as_versioned_jw'
end
