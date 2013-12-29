module Warder
  # responsible for run code duplications validation
  class CodeDuplicationsRunner < Runner
    FLAY_SCORE = SCORE / 2

    def initialize(options = {})
      @options = options
    end

    private

    def command
      "flay -d -m #{FLAY_SCORE} ."
    end

    def failed?(line)
      match = line.match(/Total score \(lower is better\) = (\d+)/)

      match && match[1].to_i != 0
    end
  end
end
