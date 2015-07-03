def executing_code_smells
  "executing 'reek --no-color . 2>/dev/null'"
end

def code_smells_output
  command_output_for_project_or_file('reek')
end
