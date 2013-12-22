module Warder
  # responsible for executing warder tools
  class CLI
    def initialize(options)
      @options = {}
      OptionParser.new(options) do |opts|
        opts.on('-s', '--[no-]style-guide', 'Run style guide validations') do |value|
          @options[:style_guide] = value
        end
      end.parse!
    end

    def perform
      exit perform_style_guide_validations
    end

    private

    def perform_style_guide_validations
      if @options[:style_guide]
        runner = StyleGuideRunner.new(@options)
        runner.perform
      else
        0
      end
    end
  end
end
