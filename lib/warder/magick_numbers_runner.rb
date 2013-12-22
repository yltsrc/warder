module Warder
  # responsible for run magick numbers validation
  class MagickNumbersRunner < Runner
    def initialize(options = {})
      @options = options
    end

    private

    def command
      'mago'
    end

    def failed?(line)
      true
    end
  end
end
