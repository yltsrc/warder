require 'aruba/cucumber'

bin_path = "#{File.expand_path('../../../bin', __FILE__)}"
ENV['PATH'] = "#{ENV['PATH']}#{File::PATH_SEPARATOR}#{bin_path}"
