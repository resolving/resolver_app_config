# coding: utf-8

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resolver_app_config/version'

Gem::Specification.new do |spec|
  spec.name          = 'resolver_app_config'
  spec.version       = ResolverAppConfig::VERSION
  spec.authors       = ['Ruben Arakelyan']
  spec.email         = ['rubena@resolvergroup.com']

  spec.summary       = 'Base configuration for Resolver consumer applications'
  spec.description   = 'Base configuration for Resolver consumer applications'
  spec.homepage      = 'https://github.com/resolving/resolver_app_config'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rails', '~> 5'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.8.0'
  spec.add_development_dependency 'simplecov', '~> 0.17'
end
