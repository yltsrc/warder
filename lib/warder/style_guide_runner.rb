module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    COMMAND_NAME = 'rubocop'
    FAILURE_REGEXP = /(\d+|no) offence/
  end
end
