require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'

desc "Build the Gem"
Rake::GemPackageTask.new(Gem::Specification.load("army-negative.gemspec")) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

desc "Generate RDoc Documentation"
Rake::RDocTask.new do |rd|
  rd.main  = "README.rdoc"
  rd.title = "Documentation for the army-negative Package"
  rd.rdoc_files.include("README.rdoc", "LICENSE", "CHANGELOG.rdoc", "lib/**/*.rb")
  rd.options << "--inline-source" << "--charset=UTF-8" << "--line-numbers"
  rd.options << "--webcvs=http://github.com/zettabyte/army-negative/tree/master/"
end
