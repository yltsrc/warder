module Warder
  # responsible for run code complexity validation
  class CodeComplexityRunner < Runner
    CLI_OPTION = 'c'.freeze
    CLI_FULL_OPTION = 'code-complexity'.freeze
    DESCRIPTION = 'Run code complexity validation'.freeze
    COMMAND_NAME = 'flog'.freeze
    FAILURE_THRESHOLD = SCORE
    FAILURE_REGEXP = /^\s+(?<issues>\d+.\d+)\:\s.*$/
    TOTAL_REGEXP = /^\s+\d+.\d+\:.*(total|average)$/

    private

    def command_with_options
      "#{COMMAND_NAME} -a -c -g -m #{@options.files}"
    end

    def number_of_issues(line)
      return 0 if total?(line)
      super
    end

    def failed?(line)
      number_of_issues(line) != 0
    end

    def printable?(line)
      super && failed?(line)
    end

    def total?(line)
      self.class::TOTAL_REGEXP.match(line)
    end
  end
end
