module Warder
  # responsible for executing warder tools
  class CLI
    def initialize(options)
      @options = OpenStruct.new(options)
    end

    def perform
      exit_codes = Warder.constants.grep(/\w+Runner/).map do |validator|
        perform_validation(validator)
      end
      exit exit_codes.compact.inject(0, :+)
    end

    private

    def perform_validation(name)
      validator = Warder.const_get(name)
      key = validator::CLI_OPTION.gsub('-', '_')
      if @options.send(key)
        runner = validator.new(@options)
        runner.perform
      end
    end
  end
end
