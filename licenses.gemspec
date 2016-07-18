# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'licenses/version'

Gem::Specification.new do |spec|
  spec.name    = File.basename(__FILE__, '.gemspec')
  spec.version = Licenses::VERSION
  spec.authors = 'Ryan Scott Lewis'
  spec.email   = 'ryan@rynet.us'

  spec.summary     = 'Easily generate software licenses.'
  spec.description = 'Provides an easy way to generate common project license files.'
  spec.homepage    = 'https://github.com/RyanScottLewis/licenses'
  spec.license     = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
end
