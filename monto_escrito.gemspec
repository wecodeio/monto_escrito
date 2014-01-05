# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monto_escrito/version'

Gem::Specification.new do |spec|
  spec.name          = "monto_escrito"
  spec.version       = MontoEscrito::VERSION
  spec.authors       = ["Lucas Videla"]
  spec.email         = ["videla.lucas@gmail.com"]
  spec.description   = %q{Helper para escribir montos con palabras en español}
  spec.summary       = %q{Esta gema expone un método para convertir a palabras un monto, utilizando el idioma español}
  spec.homepage      = "https://github.com/wecodeio/monto_escrito"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.2.0"
end
