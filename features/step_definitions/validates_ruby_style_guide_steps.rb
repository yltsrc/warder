def executing_style_guide
  "executing 'rubocop --no-color --format clang .'"
end

def style_guide_output
  command_output_for_project_or_file('rubocop --no-color --format clang')
end
