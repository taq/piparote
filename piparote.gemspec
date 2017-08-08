# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'piparote/version'

Gem::Specification.new do |spec|
  spec.name          = 'piparote'
  spec.version       = Piparote::VERSION
  spec.authors       = ['Eustaquio Rangel']
  spec.email         = ['taq@eustaquiorangel.com']

  spec.summary       = %q{Use object methods like Unix pipes}
  spec.description   = %q{Use object methods like Unix pipes}
  spec.homepage      = 'http://github.com/taq/piparote'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.14'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
