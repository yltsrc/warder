module Warder
  # responsible for run style guide validations
  class StyleGuideRunner < Runner
    def initialize(options = {})
      @options = options
    end

    private

    def command
      'rubocop'
    end

    def failed?(line)
      match = line.match(/(\d+|no) offence/)

      match && match[0].to_i != 0
    end
  end
end
