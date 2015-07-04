module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    CLI_OPTION = 'g'
    CLI_FULL_OPTION = 'style-guide'
    DESCRIPTION = 'Run ruby style guide validation'
    COMMAND_NAME = 'rubocop --no-color --format clang'
    FAILURE_REGEXP = /(?<issues>\d+|no) offense/
  end
end
