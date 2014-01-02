def executing_code_complexity
  "executing 'flog -a -c -g -m .'"
end

def code_complexity_output
  `cd spec/fixtures/ && flog -a -c -g -m ./#{@filename}`
    .split("\n")
    .reject { |line| line.match(/total|average/) }
    .join("\n")
end
