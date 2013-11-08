# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_auditor/version'

Gem::Specification.new do |spec|
  spec.name          = "gem_auditor"
  spec.version       = GemAuditor::VERSION
  spec.authors       = ["Roman Parashchenko"]
  spec.email         = ["romikoops@gmail.com"]
  spec.description   = %q{It easily finds out which gems are in need of updating in your application}
  spec.summary       = %q{Gem Version Auditor}
  spec.homepage      = "http://romikoops.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_dependency "typhoeus"
  spec.add_dependency "hydra"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
