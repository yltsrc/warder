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
  spec.summary       = %q{Warder of ruby code}
  spec.homepage      = 'https://github.com/yltsrc/warder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(/^bin\/\w+$/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features|cucumber)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop'
  spec.add_dependency 'reek'
  spec.add_dependency 'flay'
  spec.add_dependency 'ruby2ruby'
  spec.add_dependency 'flog'
  spec.add_dependency 'mago'
  spec.add_dependency 'brakeman'
  spec.add_dependency 'rails_best_practices'
  spec.add_dependency 'bundler-audit'
  # spec.add_dependency 'sandi_meter'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '3.0.0.beta1'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'simplecov'
end
