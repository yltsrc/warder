module Warder
  # responsible for run bundle freshness validation
  class BundleAuditRunner < Runner
    COMMAND_NAME = 'bundle-audit'
    FAILURE_REGEXP = /Unpatched versions found!/

    private

    def command_with_options
      path = @options.files[0]
      "#{COMMAND_NAME} update; (cd #{path} && #{COMMAND_NAME} check)"
    end

    def failed?(line)
      FAILURE_REGEXP.match(line)
    end
  end
end