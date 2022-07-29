# frozen_string_literal: true

require 'English'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monto_escrito/version'

Gem::Specification.new do |spec|
  spec.name          = 'monto_escrito'
  spec.version       = MontoEscrito::VERSION
  spec.authors       = ['Lucas Videla']
  spec.email         = ['videla.lucas@gmail.com']
  spec.description   = 'Helper para escribir montos con palabras en español'
  spec.summary       = 'Esta gema expone un método para convertir a palabras un monto, utilizando el idioma español'
  spec.homepage      = 'https://github.com/wecodeio/monto_escrito'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'minitest', '~> 5.2.0'
  spec.add_development_dependency 'rake'
end
