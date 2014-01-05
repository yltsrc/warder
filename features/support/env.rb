require 'aruba/cucumber'
require 'aruba/in_process'

require 'simplecov'
SimpleCov.start do
  add_filter '/features/'
  add_filter '/spec/'
  add_filter '/vendor/'
  add_group 'Libraries', 'lib'
end
SimpleCov::MINIMUM_COVERAGE = 100
SimpleCov.minimum_coverage SimpleCov::MINIMUM_COVERAGE

bin_path = "#{File.expand_path('../../../bin', __FILE__)}"
ENV['PATH'] = "#{bin_path}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

require 'warder'

Aruba::InProcess.main_class = Warder::CLI
Aruba.process = Aruba::InProcess
