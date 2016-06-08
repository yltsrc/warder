# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'warder/version'

Gem::Specification.new do |spec|
  spec.name          = 'warder'
  spec.version       = Warder::VERSION
  spec.authors       = ['Yura Tolstik']
  spec.email         = ['yltsrc@gmail.com']
  spec.description   = 'Warder of ruby code'
  spec.summary       = 'Tool to help improve the quality of ruby code'
  spec.homepage      = 'https://github.com/yltsrc/warder'
  spec.license       = 'MIT'

  spec.files         = Dir['{bin,lib}/**/*']
  spec.executables   = Dir['{bin}/**/*'].map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '~> 0.40'
  spec.add_dependency 'reek', '~> 4.0'
  spec.add_dependency 'flay', '~> 2.8'
  spec.add_dependency 'flog', '~> 4.4'
  spec.add_dependency 'mago', '~> 0.1'
  spec.add_dependency 'brakeman', '~> 3.3'
  spec.add_dependency 'rails_best_practices', '~> 1.16'
  spec.add_dependency 'sandi_meter', '~> 1.2'
  spec.add_dependency 'bundler-audit', '~> 0.5'
  spec.add_dependency 'coffeelint', '~> 1.14'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.1'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'cucumber', '~> 2.3'
  spec.add_development_dependency 'aruba', '~> 0.14'
  spec.add_development_dependency 'simplecov', '~> 0.11'
end
