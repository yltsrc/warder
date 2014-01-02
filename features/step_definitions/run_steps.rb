Before do
  FileUtils.mkdir_p 'tmp/aruba'
end

After do
  FileUtils.rm_rf 'tmp/aruba'
end

Given(/^I have (\w+) file in directory$/) do |name|
  @filename = "#{name}.rb"
  FileUtils.ln_s "../../spec/fixtures/#{@filename}", 'tmp/aruba/'
  expect(`ls tmp/aruba`).to match(@filename)
end

Then(/^warder does nothing$/) do
  step 'the output should match /.{0}/'
end

Then(/^warder detects (.+) issues$/) do |what|
  executing_output = send(:"executing_#{what.sub(' ', '_')}")
  step "the output should contain \"#{executing_output}\""

  validation_output = send(:"#{what.sub(' ', '_')}_output")
  validation_output.split("\n").each do |string|
    step "the output should contain \"#{string}\""
  end
end
