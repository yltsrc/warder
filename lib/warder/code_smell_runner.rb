module Warder
  # responsible for run code smell validation
  class CodeSmellRunner < Runner
    CLI_OPTION = 's'.freeze
    CLI_FULL_OPTION = 'code-smell'.freeze
    DESCRIPTION = 'Run code smell validation'.freeze
    COMMAND_NAME = 'reek --no-color'.freeze
    FAILURE_REGEXP = /(?<issues>\d+) warnings?/

    private

    def command_with_options
      "#{self.class::COMMAND_NAME} #{@options.files}"
    end
  end
end
