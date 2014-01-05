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
          opts.banner = 'Usage: warder [options] [dir1 file1 file2 ...]'
          validators(opts)
          version(opts)
        end.parse!(@argv)
      end

      def assign_files
        @options['files'] = @argv.empty? ? '.' : @argv.join(' ')
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
          @options[option] = value
        end
      end

      def version(opts)
        opts.on('-v', '--version', 'Show version') do |value|
          @stdout.puts Warder::VERSION
          @kernel.exit 0
        end
      end
    end
  end
end
