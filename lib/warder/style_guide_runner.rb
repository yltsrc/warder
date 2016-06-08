module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    CLI_OPTION = 'g'.freeze
    CLI_FULL_OPTION = 'style-guide'.freeze
    DESCRIPTION = 'Run ruby style guide validation'.freeze
    COMMAND_NAME = 'rubocop --no-color --format clang'.freeze
    FAILURE_REGEXP = /(?<issues>\d+|no) offense/
  end
end
