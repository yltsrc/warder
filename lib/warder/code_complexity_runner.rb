module Warder
  # responsible for run code complexity validation
  class CodeComplexityRunner < Runner
    CLI_OPTION = 'code-complexity'
    COMMAND_NAME = 'flog'
    FLOG_SCORE = SCORE
    FAILURE_REGEXP = /^\s+(\d+.\d+)\:\s.*$/
    TOTAL_REGEXP = /^\s+\d+.\d+\:.*(total|average)$/

    private

    def command_with_options
      "#{COMMAND_NAME} -a -c -g -m #{@options.files}"
    end

    def failed?(line)
      match = FAILURE_REGEXP.match(line)
      return false if total?(line)
      match && match[1].to_f > FLOG_SCORE
    end

    def printable?(line)
      failed?(line)
    end

    def total?(line)
      TOTAL_REGEXP.match(line)
    end
  end
end
