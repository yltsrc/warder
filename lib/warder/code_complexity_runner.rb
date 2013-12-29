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
      match = line.match(/^\s+(\d+.\d):\s+(.*)$/)

      match && match[1].to_f > FLOG_SCORE && !match[2].match(/^flog/)
    end
  end
end
