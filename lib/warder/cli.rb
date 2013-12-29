module Warder
  # responsible for executing warder tools
  class CLI
    def initialize(options)
      @options = options
    end

    def perform
      exit perform_style_guide_validation + perform_magick_numbers_validation +
        perform_code_duplication_validation
    end

    private

    def perform_style_guide_validation
      if @options[:style_guide]
        runner = StyleGuideRunner.new(@options)
        runner.perform
      else
        0
      end
    end

    def perform_magick_numbers_validation
      if @options[:magick_numbers]
        runner = MagickNumbersRunner.new(@options)
        runner.perform
      else
        0
      end
    end

    def perform_code_duplication_validation
      if @options[:code_duplications]
        runner = CodeDuplicationRunner.new(@options)
        runner.perform
      else
        0
      end
    end
  end
end
