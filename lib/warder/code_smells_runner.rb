module Warder
  # responsible for run code smells validation
  class CodeSmellsRunner < Runner
    def initialize(options = {})
      @options = options
    end

    private

    def command
      "reek #{@options.files}"
    end

    def failed?(line)
      match = line.match(/ -- (\d+) warnings?:/)

      match && match[1].to_i != 0
    end
  end
end
