Then(/^warder detects code complexity$/) do
  executing_flog_output = "executing 'flog -a -c -g -m .'"
  success_flog_output = `cd spec/fixtures/ && flog  -a -c -g -m ./#{@filename}`
  step "the output should contain \"#{executing_flog_output}\""
  success_flog_output.split("\n").each do |string|
    step "the output should contain \"#{string}\""
  end
end
