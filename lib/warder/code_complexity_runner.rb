module Warder
  # responsible for run code complexity validation
  class CodeComplexityRunner < Runner
    FLOG_SCORE = SCORE

    def initialize(options = {})
      @options = options
    end

    private

    def command
      "flog -a -c -g -m #{@options.files}"
    end

    def failed?(line)
      match = line.match(/^\s+(\d+.\d+)\:\s.*$/)
      return false if total?(line)
      match && match[1].to_f > FLOG_SCORE
    end

    def printable?(line)
      failed?(line)
    end

    def total?(line)
      line.match(/^\s+\d+.\d+\:.*(total|average)$/)
    end
  end
end
