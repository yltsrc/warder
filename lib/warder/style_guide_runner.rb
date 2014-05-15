module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    CLI_OPTION = 'g'
    CLI_FULL_OPTION = 'style-guide'
    DESCRIPTION = 'Run style guide validation'
    COMMAND_NAME = 'rubocop --no-color'
    FAILURE_REGEXP = /(\d+|no) offense/
  end
end
