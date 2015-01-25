module Warder
  # responsible for run rails best practices validation
  class RailsAdviceRunner < Runner
    CLI_OPTION = 'a'
    CLI_FULL_OPTION = 'rails-advice'
    DESCRIPTION = 'Run rails best practices validation'
    COMMAND_NAME = 'rails_best_practices'
    COMMAND_OPTIONS = '--without-color --silent --spec --test --features'
    FAILURE_REGEXP = /Found (?<issues>\d+) warnings?/

    private

    attr_reader :stats_msg

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} #{COMMAND_OPTIONS} #{path}"
    end

    def printable?(line)
      super && !FAILURE_REGEXP.match(line)
    end
  end
end
