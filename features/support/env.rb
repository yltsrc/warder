require 'aruba/cucumber'

bin_path = "#{File.expand_path('../../../bin', __FILE__)}"
ENV['PATH'] = "#{bin_path}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
