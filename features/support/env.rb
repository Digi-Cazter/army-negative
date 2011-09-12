# encoding: utf-8
require 'rake'

# Make RSpec expectations available inside our step definitions
require 'rspec/expectations'
World(RSpec::Matchers)

# Load the rails environment of our test application
ENV["RAILS_ENV"] = "test"
RAILS_ROOT = File.expand_path("../../../dummy", __FILE__)
require File.join(RAILS_ROOT, "config", "environment")

# Runs the named rake tasks for the test rails application using the "test"
# rails environment.
def run_rails_rake_tasks(*names)
  ARGV.clear
  ARGV.concat(names)
  ARGV << "RAILS_ENV=test"
  Dir.chdir(RAILS_ROOT) do
    old = Rake.application
    Rake.application = Rake::Application.new
    begin
      Rake.application.run
    ensure
      Rake.application = old
    end
  end
end

# Reset the test rails application's test environment database
run_rails_rake_tasks("db:reset", "db:fixtures:load")

