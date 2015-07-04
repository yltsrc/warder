def executing_coffee_lint
  "executing 'coffeelint .'"
end

def coffee_lint_output
  output = command_output_for_project_or_file('coffeelint.rb -r .')
           .split("\n")
           .reject { |line| !line.match(/✗ #\d+:/) }
  output.map do |str|
    str.gsub("\e[32m", '').gsub("\e[0m", '').sub('✗', 'ERROR:')
  end.join("\n")
end
