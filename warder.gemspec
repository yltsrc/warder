# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'warder/version'

Gem::Specification.new do |spec|
  spec.name          = 'warder'
  spec.version       = Warder::VERSION
  spec.authors       = ['Yura Tolstik']
  spec.email         = ['yltsrc@gmail.com']
  spec.description   = %q{Warder of ruby code}
  spec.summary       = %q{Tool to help improve the quality of ruby code}
  spec.homepage      = 'https://github.com/yltsrc/warder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(/^bin\/\w+$/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features|cucumber)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '~> 0.18'
  spec.add_dependency 'reek', '~> 1.3'
  spec.add_dependency 'flay', '~> 2.4'
  spec.add_dependency 'flog', '~> 4.2'
  spec.add_dependency 'mago', '~> 0.1'
  spec.add_dependency 'brakeman', '~> 2.4'
  spec.add_dependency 'rails_best_practices', '~> 1.15'
  spec.add_dependency 'sandi_meter', '~> 1.1'
  spec.add_dependency 'bundler-audit', '~> 0.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'cucumber', '~> 1.3'
  spec.add_development_dependency 'aruba', '~> 0.5'
  spec.add_development_dependency 'simplecov', '~> 0.8'
end
