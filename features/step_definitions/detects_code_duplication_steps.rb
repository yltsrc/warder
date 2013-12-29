Then(/^warder detects code duplication$/) do
  executing_flay_output = "executing 'flay -d -m 15 .'"
  success_flay_output = `cd spec/fixtures/ && flay -d ./#{@filename}`
  step "the output should contain \"#{executing_flay_output}\""
  success_flay_output.split("\n").each do |string|
    step "the output should contain \"#{string}\""
  end
end
