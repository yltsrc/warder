module Warder
  # responsible for run rails best practices validation
  class RailsAdviceRunner < Runner
    CLI_OPTION = 'a'
    CLI_FULL_OPTION = 'rails-advice'
    DESCRIPTION = 'Run rails best practices validation'
    COMMAND_NAME = 'rails_best_practices'
    FAILURE_REGEXP = /Found (\d+) warnings?/

    private

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} --silent --spec --test --features #{path}"
    end
  end
end
