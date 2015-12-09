Before do
  FileUtils.mkdir_p 'tmp/aruba'
end

After do
  FileUtils.rm_rf 'tmp/aruba'
end

Given(/^I have (\w+) file in directory$/) do |name|
  @filename = "#{name}.rb"
  @filename = "#{name}.coffee" unless File.exist? "spec/fixtures/#{@filename}"
  FileUtils.ln_s "../../spec/fixtures/#{@filename}", 'tmp/aruba/'
  expect(`ls tmp/aruba`).to match(@filename)
end

Then(/^warder does nothing$/) do
  step 'the output should match /.{0}/'
end

Then(/^warder detects( no)? (.+) (issues|violations)$/) do |no, what, _|
  executing_output = send(:"executing_#{what.tr(' ', '_')}")
  step "the output should#{' not' if no} contain \"#{executing_output}\""

  validation_output = send(:"#{what.tr(' ', '_')}_output")
  validation_output.split("\n").each do |string|
    step "the output should#{' not' if no} contain \"#{string}\""
  end
end

def command_output_for_project_or_file(cmd)
  if @filename
    `cd spec/fixtures/ && #{cmd} #{'./' unless cmd == 'reek'}#{@filename}`
  elsif @projectname
    `cd spec/fixtures/#{@projectname} && #{cmd} ./`
  else
    fail NotImplementedError
  end
end
