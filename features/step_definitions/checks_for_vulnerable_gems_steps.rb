def executing_gem_freshness
  "executing 'bundle-audit update; (cd . && bundle-audit check)'"
end

def gem_freshness_output
  `cd tmp/aruba/ && bundle-audit check`
end

Given(/^I have ((in)?valid) gemfile in directory$/) do |state, _|
  @filename = "#{state}_Gemfile.lock"
  FileUtils.ln_s "../../spec/fixtures/#{@filename}", 'tmp/aruba/Gemfile.lock'
  expect(`ls tmp/aruba`).to match('Gemfile.lock')
end
