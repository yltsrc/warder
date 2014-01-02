module Warder
  # abstract class for command runners
  class Runner
    SCORE = 30

    def initialize(options = {})
      @options = options
    end

    def perform
      puts "executing '#{command_with_options}'\n"
      code = 0
      IO.popen(command_with_options).each do |line|
        print line if printable?(line)
        code = 1 if failed?(line)
      end
      code
    end

    private

    def command_with_options
      "#{self.class::COMMAND_NAME} #{@options.files}"
    end

    def failed?(line)
      match = line.match(self.class::FAILURE_REGEXP)
      match && match[1].to_i != 0
    end

    def printable?(line)
      true
    end
  end
end
