module Warder
  # responsible for run code smell validation
  class CodeSmellRunner < Runner
    CLI_OPTION = 's'
    CLI_FULL_OPTION = 'code-smell'
    DESCRIPTION = 'Run code smell validation'
    COMMAND_NAME = 'reek --no-color'
    FAILURE_REGEXP = /(?<issues>\d+) warnings?/

    private

    def command_with_options
      "#{self.class::COMMAND_NAME} #{@options.files}"
    end
  end
end
