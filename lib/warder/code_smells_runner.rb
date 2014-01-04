module Warder
  # responsible for run code smells validation
  class CodeSmellsRunner < Runner
    CLI_OPTION = 'code-smells'
    COMMAND_NAME = 'reek'
    FAILURE_REGEXP = / -- (\d+) warnings?:/
  end
end
