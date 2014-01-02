module Warder
  # responsible for run code duplication validation
  class CodeDuplicationRunner < Runner
    FLAY_SCORE = SCORE / 2
    COMMAND_NAME = 'flay'
    FAILURE_REGEXP = /Total score \(lower is better\) = (\d+)/

    private

    def command_with_options
      "#{COMMAND_NAME} -d -m #{FLAY_SCORE} #{@options.files}"
    end
  end
end
