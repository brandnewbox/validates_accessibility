require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :plugin, [:url] do |t, args|
  ENV['URL']= args.url
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/validates_accessibility/plugin'
  end
  Rake::Task['spec'].invoke
end

task :test do |t|
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/validates_accessibility/validator'
  end
  Rake::Task['spec'].invoke
end