# encoding: utf-8
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'army-negative/version'

Gem::Specification.new do |s|
  s.name        =  "army-negative"
  s.version     =   Army::Negative::Version::STRING
  s.authors     = ["Kendall Gifford"]
  s.email       = ["zettabyte@gmail.com"]
  s.license     =  "MIT"
  s.homepage    =  "http://github.com/zettabyte/army-negative"
  s.summary     =  "Monkey-patches ActiveRecord's MySQL (ARMy) connection adapter to store boolean trues as negative ones"
  s.description = <<-DESCRIPTION.strip.gsub(/^\s+/, "")
    When this gem is loaded and activated inside your rails app, your MySQL
    connection adapter for ActiveRecord will be monkey-patched. The patch simply
    tweaks it to store all boolean "true" values as negative one instead of
    positive one inside your TINYINT columns. It also patches it to recognize
    and interpret negative one as "true". Positive one will still be recognized
    as true as well.

    Used for special cases, such as developing rails apps that must, for
    example, work with existing databases that use such a convention.

    For a rails app version X.Y.Z, use army-negative version "~> X.Y.0". For
    example, a rails 3.0.x app should use "~> 3.0.0" and a 3.1.x app would use
    "~> 3.1.0", etc. The exception is that rails 2.3.x apps should just use
    "~> 2.0" since 2.3 is the earliest version of rails that's supported.
  DESCRIPTION

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {features,dummy}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails",  "~> 3.2.0"
  s.add_dependency "mysql2", "~> 0.3.7"

  if s.respond_to?(:add_development_dependency)
    s.add_development_dependency "cucumber", "~> 1.0.5"
    s.add_development_dependency "rspec",    "~> 2.6.0"
  end

  if s.respond_to?(:extra_rdoc_files)
    s.extra_rdoc_files = ["README.rdoc", "LICENSE", "CHANGELOG.rdoc"]
  end
end

