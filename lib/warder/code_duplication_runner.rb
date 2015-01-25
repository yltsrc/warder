module Warder
  # responsible for run code duplication validation
  class CodeDuplicationRunner < Runner
    CLI_OPTION = 'd'
    CLI_FULL_OPTION = 'code-duplication'
    DESCRIPTION = 'Run code duplication validation'
    COMMAND_NAME = 'flay'
    FLAY_SCORE = SCORE / 2
    FAILURE_REGEXP = /code found in :\w+ \(mass(\*\d+)? = (?<issues>\d+)\)/

    private

    def command_with_options
      "#{COMMAND_NAME} -d -m #{FLAY_SCORE} #{@options.files}"
    end
  end
end
