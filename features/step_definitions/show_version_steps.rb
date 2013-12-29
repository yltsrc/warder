Then(/^warder shows version$/) do
  step "the output should contain \"#{Warder::VERSION}\""
end
