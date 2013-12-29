Then(/^warder detects code smells$/) do
  executing_reek_output = "executing 'reek .'"
  success_reek_output = `cd spec/fixtures/ && reek #{@filename}`
  step "the output should contain \"#{executing_reek_output}\""
  success_reek_output.split("\n").each do |string|
    step "the output should contain \"#{string}\""
  end
end
