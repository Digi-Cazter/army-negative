require 'army-negative/version'
require 'army-negative/railtie' if defined?(Rails)

module Army
  module Negative

    autoload :Column,       'army-negative/column'
    autoload :Quoting,      'army-negative/quoting'
    autoload :MysqlAdapter, 'army-negative/mysql_adapter'

    #
    # Called during gem initialization (via Army::Negative::Railtie) in order to
    # active army-negative and ensure all true values get stored as -1 and that
    # -1's are recognized as true.
    #
    def activate!
      ActiveRecord::ConnectionAdapters::Column.send  :extend,  Column
      ActiveRecord::ConnectionAdapters::Quoting.send :include, Quoting
      # There may be one of two mysql adapters...
      adapter = 0
      begin
        adapter += 1
        require "active_record/connection_adapters/mysql#{adapter == 1 ? "" : adapter}_adapter"
      rescue LoadError => e
        retry unless adapter >= 2
        raise e
      end
      "ActiveRecord::ConnectionAdapters::Mysql#{adapter == 1 ? "" : adapter}Adapter".constantize.send :include, MysqlAdapter
    end
    module_function :activate!

  end
end
