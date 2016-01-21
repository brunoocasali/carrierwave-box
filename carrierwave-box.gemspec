# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/box/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-box"
  spec.version       = Carrierwave::Box::VERSION
  spec.authors       = ["Bruno Casali"]
  spec.email         = ["brunoocasali@gmail.com"]

  spec.summary       = %q{Storage for carrierwave using Box}
  spec.description   = %q{A little integration with box.com}
  spec.homepage      = "http://github.com/brunoocasali/carrierwave-box"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "carrierwave", "~> 0.10"
  spec.add_dependency "dropbox-sdk", "~> 1.6.4"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
end
