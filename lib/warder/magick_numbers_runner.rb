module Warder
  # responsible for run magick numbers validation
  class MagickNumbersRunner < Runner
    COMMAND_NAME = 'mago'

    private

    def failed?(*)
      true
    end
  end
end
