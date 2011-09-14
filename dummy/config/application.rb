# encoding: utf-8
require File.expand_path('../boot', __FILE__)
require 'rails/all'
if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
end
module Dummy
  class Application < Rails::Application
    config.encoding = "utf-8"
  end
end
