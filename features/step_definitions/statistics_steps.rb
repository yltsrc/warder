Given(/^(\d+) (.+) stats should( not)? be printed$/) do |number, what, no|
  string = "found #{number} #{what} issues"
  step "the output should#{no} contain \"#{string}\""
end
