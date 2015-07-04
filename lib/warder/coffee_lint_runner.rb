module Warder
  # responsible for run coffeescript style guide validation
  class CoffeeLintRunner < Runner
    require 'warder/coffee_lint_runner/lint_runner'
    require 'warder/coffee_lint_runner/message_formatter'

    CLI_OPTION = 'g'
    CLI_FULL_OPTION = 'coffee-lint'
    DESCRIPTION = 'Run coffeescript style guide validation'
    COMMAND_NAME = 'coffeelint'
    FAILURE_REGEXP = /(?<issues>(WARN|ERROR))/

    private

    def run_command
      @stdout.puts(exec_msg) unless quiet?
      lint_results.each do |filename, result|
        next if result.empty?
        yield "\n#{filename}\n#{MessageFormatter.new(result).format}"
      end
      @stdout.puts(stats_msg) if stats?
    end

    def lint_results
      lint_results = {}
      @options.files.split(' ').each do |filename|
        next if filename.length == 0
        lint_results.merge!(LintRunner.new(filename).result)
      end
      lint_results
    end

    def number_of_issues(line)
      self.class::FAILURE_REGEXP.match(line) ? 1 : 0
    end
  end
end
