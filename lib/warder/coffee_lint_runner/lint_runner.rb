require 'coffeelint'

module Warder
  # responsible for run coffeescript style guide validation
  class CoffeeLintRunner
    # responsible for coffeelint results
    class LintRunner
      def initialize(file_or_path)
        @file_or_path = file_or_path
      end

      def result
        if Dir.exist?(@file_or_path)
          Coffeelint.lint_dir(@file_or_path)
        else
          { @file_or_path => Coffeelint.lint_file(@file_or_path) }
        end
      end
    end
  end
end
