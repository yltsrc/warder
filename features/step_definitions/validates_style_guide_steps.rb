Then(/^warder validates style guide$/) do
  executing_rubocop_output = "executing 'rubocop'"
  success_rubocop_output = `rubocop spec/fixtures/#{@filename} | grep offence`
  step "the output should contain \"#{executing_rubocop_output}\""
  step "the output should contain \"#{success_rubocop_output}\""
end
