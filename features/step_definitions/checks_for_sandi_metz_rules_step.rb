def executing_sandi_rules
  "executing 'sandi_meter -d -p .'"
end

def sandi_rules_output
  `cd tmp/aruba/#{@projectname}/ && sandi_meter -d -p .`
end
