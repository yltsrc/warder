module Warder
  # responsible for run bundle freshness validation
  class BundleAuditRunner < Runner
    CLI_OPTION = 'b'
    CLI_FULL_OPTION = 'bundle-audit'
    DESCRIPTION = 'Run bundle freshness validation'
    COMMAND_NAME = 'bundle-audit'
    FAILURE_REGEXP = /(No v|V)ulnerabilities found/

    private

    attr_reader :stats_msg

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} update &> /dev/null && "\
        "(cd #{path} && #{COMMAND_NAME} check)"
    end

    def number_of_issues(line)
      match = FAILURE_REGEXP.match(line)
      return 0 unless match
      @stats_msg = line
      match[1].match('No ') ? 0 : 1
    end

    def printable?(line)
      super && !FAILURE_REGEXP.match(line)
    end
  end
end
