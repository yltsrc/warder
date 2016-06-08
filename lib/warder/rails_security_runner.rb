module Warder
  # responsible for run rails security validation
  class RailsSecurityRunner < Runner
    CLI_OPTION = 'i'.freeze
    CLI_FULL_OPTION = 'rails-security'.freeze
    DESCRIPTION = 'Run rails security validation'.freeze
    COMMAND_NAME = 'brakeman'.freeze
    FAILURE_REGEXP = /^\| (High|Medium|Weak)/
    PRINTABLE_REGEXP =
      /(\| Confidence)|(\| High)|(\| Medium)|(\| Weak)|(\+------------\+)/

    private

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} -q -p #{path}"
    end

    def printable?(line)
      super && self.class::PRINTABLE_REGEXP.match(line)
    end

    def number_of_issues(line)
      self.class::FAILURE_REGEXP.match(line) ? 1 : 0
    end
  end
end
