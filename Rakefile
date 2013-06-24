
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

task :default => [:spec, :jslint_production, :jslint_test, :'jasmine:ci']

task :jslint_production do
  ['loader', 'render', 'events'].each do |file|
    sh jslint "public/javascripts/#{file}.js", predefs: ['n', 'blockquoted', '$', 'haml']
  end
end

task :jslint_test do
  Dir['spec/javascripts/*-spec.js'].each do |file|
    sh jslint file, predefs: ['$', 'blockquoted', 'describe', 'beforeEach', 'it', 'expect', 'jasmine']
  end
end

def jslint(file, opts={})
  predefs = opts.key?(:predefs) ? "--predef='[#{opts[:predefs].map { |word| "\\\"#{word}\\\""}.join(',')}]'" : ''
  "jslint --browser=true #{predefs} #{file}"
end
