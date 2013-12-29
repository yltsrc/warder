Then(/^warder validates style guide$/) do
  executing_rubocop_output = "executing 'rubocop .'"
  success_rubocop_output = `cd spec/fixtures/ && rubocop #{@filename}`
  step "the output should contain \"#{executing_rubocop_output}\""
  success_rubocop_output.split("\n").each do |string|
    step "the output should contain \"#{string}\""
  end
end
