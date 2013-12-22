module Warder
  # abstract class for command runners
  class Runner
    SCORE = 30

    def perform
      puts "executing '#{command}'\n"
      code = 0
      IO.popen(command).each do |line|
        print line

        code = 1 if failed?(line)
      end
      code
    end

    private

    def failed?(line)
      false
    end
  end
end
