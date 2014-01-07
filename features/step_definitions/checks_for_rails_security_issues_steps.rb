def executing_rails_security
  "executing 'brakeman -q -p .'"
end

def rails_security_output
  `cd tmp/aruba/#{@projectname}/ && brakeman -q -p .`
    .split("\n")
    .reject { |line| !line.match(/^\+|\|/) }
    .join("\n")
end

Given(/^I have ((in)?valid_rails_app) project in directory$/) do |name, _|
  @projectname = name
  FileUtils.ln_s "../../spec/fixtures/#{@projectname}", 'tmp/aruba/'
  expect(`ls tmp/aruba`).to match(@projectname)
end

Given(/^I am on project directory$/) do
  @dirs = ["tmp/aruba/#{@projectname}"]
end
