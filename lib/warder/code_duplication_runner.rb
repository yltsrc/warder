module Warder
  # responsible for run code duplication validation
  class CodeDuplicationRunner < Runner
    CLI_OPTION = 'code-duplication'
    COMMAND_NAME = 'flay'
    FLAY_SCORE = SCORE / 2
    FAILURE_REGEXP = /Total score \(lower is better\) = (\d+)/

    private

    def command_with_options
      "#{COMMAND_NAME} -d -m #{FLAY_SCORE} #{@options.files}"
    end
  end
end
