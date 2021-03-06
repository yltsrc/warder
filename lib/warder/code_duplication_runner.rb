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
      "#{COMMAND_NAME} -m #{flay_score} #{@options.files}"
    end

    def flay_score
      env_flay_score = ENV['FLAY_SCORE']
      return self.class::FLAY_SCORE unless env_flay_score
      env_flay_score.to_i
    end
  end
end
