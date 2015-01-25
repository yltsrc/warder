def executing_gem_freshness
  "executing 'bundle-audit update &> /dev/null && (cd . && bundle-audit check)'"
end

def gem_freshness_output
  if @projectname
    prep = "cd spec/fixtures/#{@projectname}/ && cp Gemfile_lock Gemfile.lock"
    `#{prep} && bundle-audit check; rm -f Gemfile.lock`
      .split("\n")
      .reject { |line| line.match('patched versions found') }
      .join("\n")
  else
    fail NotImplementedError
  end
end
