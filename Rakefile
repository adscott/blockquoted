
begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, :'jasmine:ci']
