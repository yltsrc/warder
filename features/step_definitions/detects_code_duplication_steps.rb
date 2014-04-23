def executing_code_duplication
  "executing 'flay -d -m 15 .'"
end

def code_duplication_output
  command_output_for_project_or_file('flay -d')
end
