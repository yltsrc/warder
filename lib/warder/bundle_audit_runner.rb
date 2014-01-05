module Warder
  # responsible for run bundle freshness validation
  class BundleAuditRunner < Runner
    CLI_OPTION = 'b'
    CLI_FULL_OPTION = 'bundle-audit'
    DESCRIPTION = 'Run bundle freshness validation'
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
