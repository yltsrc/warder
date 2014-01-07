module Warder
  # responsible for run rails security validation
  class RailsSecurityRunner < Runner
    CLI_OPTION = 'i'
    CLI_FULL_OPTION = 'rails-security'
    DESCRIPTION = 'Run magick numbers validation'
    COMMAND_NAME = 'brakeman'
    FAILURE_REGEXP = /^\| Security Warnings \| (\d)+/
    PRINTABLE_REGEXP = /^(\+|\||View Warnings:)/

    private

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} -q -p #{path}"
    end

    def printable?(line)
      PRINTABLE_REGEXP.match(line)
    end
  end
end
