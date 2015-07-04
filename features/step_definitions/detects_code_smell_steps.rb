def executing_code_smell
  "executing 'reek --no-color .'"
end

def code_smell_output
  command_output_for_project_or_file('reek')
end
