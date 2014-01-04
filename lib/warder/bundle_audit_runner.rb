module Warder
  # responsible for run bundle freshness validation
  class BundleAuditRunner < Runner
    CLI_OPTION = 'bundle-audit'
    COMMAND_NAME = 'bundle-audit'
    FAILURE_REGEXP = /Unpatched versions found!/

    private

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} update; (cd #{path} && #{COMMAND_NAME} check)"
    end

    def failed?(line)
      FAILURE_REGEXP.match(line)
    end
  end
end
