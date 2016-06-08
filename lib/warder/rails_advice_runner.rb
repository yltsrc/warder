module Warder
  # responsible for run rails best practices validation
  class RailsAdviceRunner < Runner
    CLI_OPTION = 'a'.freeze
    CLI_FULL_OPTION = 'rails-advice'.freeze
    DESCRIPTION = 'Run rails best practices validation'.freeze
    COMMAND_NAME = 'rails_best_practices'.freeze
    COMMAND_OPTIONS = '--without-color --silent --spec --test --features'.freeze
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
