module Warder
  # responsible for run magick numbers validation
  class MagickNumbersRunner < Runner
    CLI_OPTION = 'm'
    CLI_FULL_OPTION = 'magick-numbers'
    DESCRIPTION = 'Run magick numbers validation'
    COMMAND_NAME = 'mago'

    private

    def number_of_issues(_line)
      1
    end
  end
end
