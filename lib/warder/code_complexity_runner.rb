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
      match = line.match(/^\s+(\d+.\d+)\:\s[^f][^l][^o][^g].*$/)

      match && match[1].to_f > FLOG_SCORE
    end

    def printable?(line)
      failed?(line) || total?(line)
    end

    def total?(line)
      line.match(/^\s+\d+.\d+\:\sflog.*$/)
    end
  end
end
