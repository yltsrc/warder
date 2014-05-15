def executing_style_guide
  "executing 'rubocop --no-color .'"
end

def style_guide_output
  command_output_for_project_or_file('rubocop')
end
