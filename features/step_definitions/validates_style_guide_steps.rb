def executing_style_guide
  "executing 'rubocop .'"
end

def style_guide_output
  `cd spec/fixtures/ && rubocop #{@filename}`
end
