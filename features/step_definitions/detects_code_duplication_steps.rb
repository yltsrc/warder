def executing_code_duplication
  "executing 'flay -d -m 15 .'"
end

def code_duplication_output
  `cd spec/fixtures/ && flay -d ./#{@filename}`
end
