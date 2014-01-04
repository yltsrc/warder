module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    CLI_OPTION = 'style-guide'
    COMMAND_NAME = 'rubocop'
    FAILURE_REGEXP = /(\d+|no) offence/
  end
end
