def executing_magick_numbers
  "executing 'mago .'"
end

def magick_numbers_output
  `cd spec/fixtures/ && mago #{@filename}`
end
