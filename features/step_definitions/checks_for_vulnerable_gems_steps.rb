def executing_gem_freshness
  "executing 'bundle-audit update; (cd . && bundle-audit check)'"
end

def gem_freshness_output
  if @projectname
    prep = "cd spec/fixtures/#{@projectname}/ && cp Gemfile_lock Gemfile.lock"
    `#{prep} && bundle-audit check; rm -f Gemfile.lock`
  else
    fail NotImplementedError
  end
end
