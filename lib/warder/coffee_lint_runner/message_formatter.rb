require 'warder/coffee_lint_runner/message_line_formatter'

module Warder
  # responsible for run coffeescript style guide validation
  class CoffeeLintRunner
    # responsible for human readable result of coffeelint validation
    class MessageFormatter
      def initialize(result)
        @result = result
      end

      def format
        @result.map do |result|
          MessageLineFormatter.new(result).format
        end.join("\n")
      end
    end
  end
end
