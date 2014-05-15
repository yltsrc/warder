require 'optparse'

module Warder
  class CLI
    # responsible for parsing cli arguments
    class Arguments
      def initialize(argv, stdout, kernel)
        @argv = argv
        @stdout = stdout
        @kernel = kernel
        @options = {}
      end

      def parse
        parse_options
        assign_files
        OpenStruct.new(@options)
      end

      private

      def parse_options
        OptionParser.new do |opts|
          combined(opts)
          validators(opts)
        end.parse!(@argv)
      end

      def assign_files
        @options['files'] = @argv.empty? ? '.' : @argv.join(' ')
      end

      def combined(opts)
        version(opts)
        opts.banner = 'Usage: warder [options] [dir1 file1 file2 ...]'
        all(opts)
        rails(opts)
      end

      def version(opts)
        opts.on('-v', '--version', 'Show version') do |_|
          @stdout.puts Warder::VERSION
          @kernel.exit 0
        end
      end

      def all(opts)
        opts.on('-A', '--all', 'Run all validators') do |value|
          all_validators(value)
        end
      end

      def all_validators(value)
        Warder.validators.each do |validator|
          full_option = validator::CLI_FULL_OPTION
          @options[full_option] = value
        end
      end

      def rails(opts)
        desc = 'Run rails related validators'
        opts.on('-R', '--[no-]rails', desc) do |value|
          rails_validators(value)
        end
      end

      def rails_validators(value)
        Warder.validators.each do |validator|
          full_option = validator::CLI_FULL_OPTION
          if validator.to_s.match(/\AWarder::Rails/)
            @options[full_option] = value
          end
        end
      end

      def validators(opts)
        Warder.validators.each do |validator|
          validator(opts, validator)
        end
      end

      def validator(opts, validator)
        option = validator::CLI_OPTION
        full_option = validator::CLI_FULL_OPTION
        desc = validator::DESCRIPTION

        opts.on("-#{option}", "--[no-]#{full_option}", desc) do |value|
          @options[full_option] = value
        end
      end
    end
  end
end
