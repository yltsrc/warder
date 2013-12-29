Then(/^warder detects magick numbers$/) do
  executing_mago_output = "executing 'mago'"
  success_mago_output = `cd spec/fixtures/ && mago #{@filename}`
  step "the output should contain \"#{executing_mago_output}\""
  success_mago_output.split("\n").each do |string|
    step "the output should contain \"#{string}\""
  end
end
