def executing_code_complexity
  "executing 'flog -a -c -g -m .'"
end

def code_complexity_output
  raw_output = command_output_for_project_or_file('flog -a -c -g -m')
  raw_output.split("\n").reject do |line|
    /total|average/.match(line) ||
      Warder::CodeComplexityRunner::FAILURE_THRESHOLD > line.to_i
  end.join("\n")
end
