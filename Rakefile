require "bundler/gem_tasks"
require "rake/testtask"
require 'rubocop/rake_task'

# Add additional test suite definitions to the default test task here
namespace :spec do
  desc 'Runs RuboCop on specified directories'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # Dirs: app, lib, test
    task.patterns = ['exe/**/*.rb', 'lib/**/*.rb', 'spec/**/*_spec.rb']

    # Make it easier to disable cops.
    task.options << "--display-cop-names"

    # Abort on failures (fix your code first)
    task.fail_on_error = true
  end
end

Rake::TestTask.new(:spec) do |t|
  t.libs << "spec"
  t.libs << "lib"
  t.test_files = FileList['spec/**/*_spec.rb']
end

Rake::Task[:spec].enhance ['spec:rubocop']

task :default => :spec
