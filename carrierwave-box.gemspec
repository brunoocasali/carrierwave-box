# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/box/version'

Gem::Specification.new do |spec|
  spec.name          = 'carrierwave-box'
  spec.version       = Carrierwave::Box::VERSION
  spec.authors       = ['Bruno Casali']
  spec.email         = ['brunoocasali@gmail.com']

  spec.summary       = 'Storage for carrierwave using Box'
  spec.description   = 'A little integration with box.com'
  spec.homepage      = 'http://github.com/brunoocasali/carrierwave-box'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'carrierwave', '~> 0.10'
  spec.add_dependency 'boxr', '~> 1.0.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.36.0'
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
  spec.add_development_dependency 'sinatra', '~> 1.4'
  spec.add_development_dependency 'activerecord', '~> 4.2'
end
