module Warder
  # responsible for run Sandi Metz rules validation
  class SandiRulesRunner < Runner
    CLI_OPTION = 'r'
    CLI_FULL_OPTION = 'sandi-rules'
    DESCRIPTION = 'Run Sandi Metz rules validation'
    COMMAND_NAME = 'sandi_meter'
    FAILURE_REGEXP = /\d\. (?<percentage>\d+)%/
    FAILURE_THRESHOLD = 100

    private

    def command_with_options
      path = @options.files.split(' ').first
      "#{COMMAND_NAME} -d -p #{path}"
    end

    def number_of_issues(line)
      match = klass::FAILURE_REGEXP.match(line)
      return 0 unless match
      percentage = match[:percentage].to_i
      klass::FAILURE_THRESHOLD > percentage ? 1 : 0
    end

    def stats_msg
      "broken #{@issues.to_i} out of 4 #{CLI_FULL_OPTION.sub('-', ' ')}\n"
    end
  end
end
