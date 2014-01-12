module Warder
  # abstract class for command runners
  class Runner
    SCORE = 30
    FAILURE_THRESHOLD = 0

    def initialize(stdout, options = {})
      @stdout = stdout
      @options = options
      @exit_code = 0
    end

    def perform
      run_command do |line|
        @stdout.puts(line) if printable?(line)
        @exit_code = 1 if failed?(line)
      end
      @exit_code
    end

    private

    def run_command
      @stdout.puts "executing '#{command_with_options}'\n"
      IO.popen(command_with_options).each do |line|
        yield(line)
      end
    end

    def command_with_options
      "#{self.class::COMMAND_NAME} #{@options.files}"
    end

    def failed?(line)
      klass = self.class
      match = klass::FAILURE_REGEXP.match(line)
      match && match[1].to_i != klass::FAILURE_THRESHOLD
    end

    def printable?(*)
      true
    end
  end
end
