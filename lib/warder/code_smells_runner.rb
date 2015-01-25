module Warder
  # responsible for run code smells validation
  class CodeSmellsRunner < Runner
    CLI_OPTION = 's'
    CLI_FULL_OPTION = 'code-smells'
    DESCRIPTION = 'Run code smells validation'
    COMMAND_NAME = 'reek --no-color'
    FAILURE_REGEXP = /(?<issues>\d+) warnings?/
  end
end
