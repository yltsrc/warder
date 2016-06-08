module Warder
  # responsible for run magick numbers validation
  class MagickNumbersRunner < Runner
    CLI_OPTION = 'm'.freeze
    CLI_FULL_OPTION = 'magick-numbers'.freeze
    DESCRIPTION = 'Run magick numbers validation'.freeze
    COMMAND_NAME = 'mago'.freeze

    private

    def number_of_issues(_line)
      1
    end
  end
end
