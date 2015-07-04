module Warder
  # responsible for run coffeescript style guide validation
  class CoffeeLintRunner
    # responsible for human readable error message representation
    class MessageLineFormatter
      MESSAGE_KEY = 'message'.freeze
      CONTEXT_KEY = 'context'.freeze
      LEVEL_KEY = 'level'.freeze
      LINE_NUMBER_KEY = 'lineNumber'.freeze

      def initialize(result)
        @result = result
      end

      def format
        msg = [@result[MESSAGE_KEY], @result[CONTEXT_KEY]].join('. ')
        [level, line_number, msg].join(': ')
      end

      private

      def line_number
        "##{@result[LINE_NUMBER_KEY]}"
      end

      def level
        @result[LEVEL_KEY].upcase
      end
    end
  end
end
