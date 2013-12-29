module Warder
  # responsible for run style guide validation
  class StyleGuideRunner < Runner
    def initialize(options = {})
      @options = options
    end

    private

    def command
      "rubocop #{@options.files}"
    end

    def failed?(line)
      match = line.match(/(\d+|no) offence/)

      match && match[1].to_i != 0
    end
  end
end
