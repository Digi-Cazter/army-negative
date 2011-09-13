# encoding: utf-8
require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(:default, Rails.env) if defined?(Bundler)
module Dummy
  class Application < Rails::Application
    config.encoding = "utf-8"
  end
end
