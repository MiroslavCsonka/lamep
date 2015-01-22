# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'lamep'
  spec.version       = 0.2
  spec.authors       = ['Martin Svoboda', 'Miroslav Csonka']
  spec.email         = ['miroslav.csonka@gmail.com']
  spec.summary       = %q{Logical and mathematical expression parser}
  spec.description   = %q{Loads logical or mathematical expression (in string) into Abstract Syntax Tree for later evaluation}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
