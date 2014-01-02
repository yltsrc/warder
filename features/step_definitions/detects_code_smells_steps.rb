def executing_code_smells
  "executing 'reek .'"
end

def code_smells_output
  `cd spec/fixtures/ && reek #{@filename}`
end
