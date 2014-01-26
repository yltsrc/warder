module Warder
  # responsible for executing warder tools
  class CLI
    def initialize(argv, stdin = STDIN, stdout = STDOUT,
                   stderr = STDERR, kernel = Kernel)
      @argv = argv
      @stdin = stdin
      @stdout = stdout
      @stderr = stderr
      @kernel = kernel
    end

    def execute!
      @kernel.exit execute
    end

    private

    def execute
      parse_arguments
      exit_codes = Warder.validators.map do |validator|
        perform_validation(validator)
      end
      exit_codes.compact.inject(0, :+)
    end

    def parse_arguments
      args = Arguments.new(@argv, @stdout, @kernel)
      @options = args.parse
    end

    def perform_validation(validator)
      key = validator::CLI_FULL_OPTION

      if @options.send(key)
        runner = validator.new(@stdout, @options)
        runner.perform
      end
    end
  end
end
