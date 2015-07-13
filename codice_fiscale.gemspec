# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codice_fiscale/version'

Gem::Specification.new do |spec|
  spec.name          = 'codice_fiscale'
  spec.version       = CodiceFiscale::VERSION
  spec.authors       = ['Andrea Salicetti']
  spec.email         = ['andrea.salicetti@gmail.com']
  spec.summary       = 'A bunch of utilities to play with italian fiscal code.'
  spec.description   = 'Gem to play with italian fiscal code'
  spec.homepage      = 'http://www.andreasalicetti.com'
  spec.license       = 'MIT'

  spec.add_dependency('activerecord', '>= 0')

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
