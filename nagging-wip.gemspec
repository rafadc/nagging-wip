# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nagging_wip/version'

Gem::Specification.new do |spec|
  spec.name          = "nagging-wip"
  spec.version       = NaggingWip::VERSION
  spec.authors       = ["Rafa de Castro"]
  spec.email         = ["rafael@micubiculo.com"]
  spec.description   = %q{A simple tool to nag my teammates when we go over our agreed WIP}
  spec.summary       = %q{This provides a command line that checks some project's work in progress value and notifies participants }
  spec.homepage      = "https://github.com/rafadc/nagging-wip"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'mail', '~> 2.5.4'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec-core'
  spec.add_development_dependency 'rspec-expectations'
  spec.add_development_dependency 'rspec-mocks'
  spec.add_development_dependency 'coveralls'
end
