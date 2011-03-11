require 'army-negative'
require 'rails'

module Army
  module Negative
    class Railtie < Rails::Railtie
      initializer "army-negative.patch_active_record", :after => "active_record.initialize_database" do
        Army::Negative.patch_active_record!
        Army::Negative.patch_mysql_adapter!
      end
    end
  end
end
