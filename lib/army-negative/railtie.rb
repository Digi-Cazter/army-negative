require 'army-negative'
require 'rails'

module Army
  module Negative
    class Railtie < Rails::Railtie
      initializer "army-negative.activate" do
        ActiveSupport.on_load(:active_record) { Army::Negative.activate! }
      end
    end
  end
end
