require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

namespace :spec do
  desc 'Run specs that should pass'
  RSpec::Core::RakeTask.new(:ok) do |t|
    t.rspec_opts = '--tag ~wip'
    t.pattern = './spec/**/*_spec.rb'
  end

  desc 'Run specs that are being worked on'
  RSpec::Core::RakeTask.new(:wip) do |t|
    t.rspec_opts = '--color --tag wip'
    t.pattern = './spec/**/*_spec.rb'
  end

  desc 'Run all specs'
  RSpec::Core::RakeTask.new(:all) do |t|
    t.rspec_opts = '--color'
    t.pattern = './spec/**/*_spec.rb'
  end
end

namespace :cucumber do
  desc 'Run features that should pass'
  Cucumber::Rake::Task.new(:ok) do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'ok'
  end

  desc 'Run features that are being worked on'
  Cucumber::Rake::Task.new(:wip) do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'wip'
  end

  desc 'Run all features'
  Cucumber::Rake::Task.new(:all) do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'default'
  end
end

desc 'Alias for cucumber:ok'
task cucumber: 'cucumber:ok'

desc 'Alias for spec:ok'
task spec: 'spec:ok'

task wip: %w(spec:wip cucumber:wip)
task all: %w(spec:all cucumber:all)
task default: %w(spec cucumber)
