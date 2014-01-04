def failed?(str)
  match = str.match(/\d+/)
  match && match[1].to_i != 0
end
