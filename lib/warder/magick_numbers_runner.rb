module Warder
  # responsible for run magick numbers validation
  class MagickNumbersRunner < Runner
    COMMAND_NAME = 'mago'

    private

    def failed?(line)
      true
    end
  end
end
