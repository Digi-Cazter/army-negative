# encoding: utf-8
require 'rubygems'

begin
  require 'bundler/setup'
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end
require 'bundler/gem_tasks'

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "Army::Negative"
  rdoc.options << "--line-numbers"
  rdoc.rdoc_files.include("README.rdoc", "LICENSE", "CHANGELOG.rdoc", "lib/**/*.rb")
end

require 'cucumber'
require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => :features

