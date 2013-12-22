Then(/^warder validates style guide$/) do
  executing_rubocop_output = "executing 'rubocop'"
  success_rubocop_output = `rubocop spec/fixtures/#{@filename} | grep offence`
  step "the output should match /#{executing_rubocop_output}/"
  step "the output should match /#{success_rubocop_output}/"
end
