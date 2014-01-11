def rails_best_practices_cmd
  'rails_best_practices --silent --spec --test --features .'
end

def executing_rails_best_practices
  "executing '#{rails_best_practices_cmd}'"
end

def rails_best_practices_output
  `cd tmp/aruba/#{@projectname}/ && #{rails_best_practices_cmd}`
end
