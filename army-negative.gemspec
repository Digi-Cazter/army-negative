require File.join(File.dirname(__FILE__), 'lib', 'army-negative', 'version')
gemspec = Gem::Specification.new('army-negative', Army::Negative::Version::STRING) do |s|
  s.summary      = "Monkey-patches ActiveRecord's MySQL (ARMy) connection adapter to store boolean trues as negative ones"
  s.description  = <<-DESCRIPTION.strip.gsub(/^\s+/, '')
    When this gem is loaded in your rails app (Gemfile) your MySQL connection
    adapter for ActiveRecord will be monkey-patched. The patch simply tweaks it
    to store all boolean "true" values as negative one instead of positive one
    inside your TINYINT columns. It also patches it to recognize and interpret
    negative one as "true". Positive one will still be recognized as true as
    well.

    Used for special cases, such as developing rails apps that must, for
    example, work with existing databases that use such a convention.
  DESCRIPTION
  s.authors                   = ['Kendall Gifford']
  s.email                     = ['zettabyte@gmail.com']
  s.homepage                  =  'http://github.com/zettabyte/army-negative/wiki'
  s.rubyforge_project         =  'army-negative'
  s.require_path              =  'lib'
  s.required_rubygems_version =  '>= 1.3.6'
  s.files                     = Dir.glob("lib/**/*") + %w{LICENSE README.rdoc CHANGELOG.rdoc}
  s.platform                  = Gem::Platform::RUBY
end
