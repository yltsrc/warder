module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    CLI_OPTION = 'g'
    CLI_FULL_OPTION = 'style-guide'
    DESCRIPTION = 'Run style guide validation'
    COMMAND_NAME = 'rubocop'
    FAILURE_REGEXP = /(\d+|no) offence/
  end
end
