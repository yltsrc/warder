module Warder
  # responsible for run Sandi Metz rules validation
  class SandiRulesRunner < Runner
    CLI_OPTION = 'r'
    CLI_FULL_OPTION = 'sandi-rules'
    DESCRIPTION = 'Run Sandi Metz rules validation'
    COMMAND_NAME = 'sandi_meter'
    FAILURE_REGEXP = /\d\. (\d+)%/
    FAILURE_THRESHOLD = 100

    private

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} -d -p #{path}"
    end
  end
end
