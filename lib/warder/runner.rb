module Warder
  # abstract class for command runners
  class Runner
    SCORE = 30
    FAILURE_THRESHOLD = 0

    def initialize(stdout, options = {})
      @stdout = stdout
      @options = options
      @issues = 0
    end

    def perform
      run_command do |line|
        @issues += number_of_issues(line)
        @stdout.puts(line) if printable?(line)
      end
      @issues > 0 ? 1 : 0
    end

    private

    def run_command
      @stdout.puts(exec_msg) unless quiet?
      IO.popen(command_with_options).each do |line|
        yield(line)
      end
      @stdout.puts(stats_msg) if stats?
    end

    def exec_msg
      "executing '#{command_with_options}'\n"
    end

    def stats_msg
      "found #{@issues.to_i} #{klass::CLI_FULL_OPTION.sub('-', ' ')} issues\n"
    end

    def command_with_options
      "#{self.class::COMMAND_NAME} #{@options.files}"
    end

    def number_of_issues(line)
      match = klass::FAILURE_REGEXP.match(line)
      return 0 unless match
      issues = match[:issues].to_i
      return 0 unless issues > klass::FAILURE_THRESHOLD
      issues
    end

    def printable?(_line)
      !quiet?
    end

    def quiet?
      @options['quiet']
    end

    def stats?
      @options['stats']
    end

    def klass
      self.class
    end
  end
end
