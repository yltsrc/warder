def rails_best_practices_cmd
  'rails_best_practices --without-color --silent --spec --test --features .'
end

def executing_rails_best_practices
  "executing '#{rails_best_practices_cmd}'"
end

def rails_best_practices_output
  `cd tmp/aruba/#{@projectname}/ && #{rails_best_practices_cmd}`
    .split("\n")
    .reject { |line| line.match(/Found \d+ warnings/) }
    .join("\n")
end
