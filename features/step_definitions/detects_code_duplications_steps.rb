Then(/^warder detects code duplications$/) do
  executing_flay_output = "executing 'flay -d -m 15 .'"
  success_flay_output = `flay -d spec/fixtures/#{@filename}`
  step "the output should contain \"#{executing_flay_output}\""
  success_flay_output.split("\n").each do |string|
    step "the output should contain \"#{string.sub('spec/fixtures/', './')}\""
  end
end
