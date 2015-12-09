module Warder
  # responsible for cli integration
  class CLI < ArubaApp
    def initialize(argv, stdin = STDIN, stdout = STDOUT,
                   stderr = STDERR, kernel = Kernel)
      super
      @argv = argv
    end

    private

    def execute
      options = Arguments.new(@argv, @stdout, @kernel).parse
      exit_codes = Warder.validators.map do |validator|
        perform_validation(validator, options)
      end
      exit_codes.compact.inject(0, :+)
    end

    def perform_validation(validator, options)
      key = validator::CLI_FULL_OPTION
      return 0 unless options.send(key)
      runner = validator.new(@stdout, options)
      runner.perform
    end
  end
end
