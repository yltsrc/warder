def executing_rails_security
  "executing 'brakeman -q -p .'"
end

def rails_security_output
  regexp = Warder::RailsSecurityRunner::PRINTABLE_REGEXP
  `cd tmp/aruba/#{@projectname}/ && brakeman -q -p .`
    .split("\n")
    .reject { |line| !regexp.match(line) }
    .join("\n")
end

Given(/^I have ((in)?valid_rails_app) project in directory$/) do |name, _|
  @projectname = name
  FileUtils.cp_r "spec/fixtures/#{@projectname}", 'tmp/aruba/'
  FileUtils.mv "tmp/aruba/#{@projectname}/Gemfile_lock",
               "tmp/aruba/#{@projectname}/Gemfile.lock"
  expect(`ls tmp/aruba`).to match(@projectname)
end

Given(/^I am on project directory$/) do
  @dirs = ["tmp/aruba/#{@projectname}"]
end
