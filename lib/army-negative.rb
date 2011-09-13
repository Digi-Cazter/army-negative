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
      require 'active_record/connection_adapters/mysql_adapter'
      ActiveRecord::ConnectionAdapters::Column.send       :extend,  Column
      ActiveRecord::ConnectionAdapters::Quoting.send      :include, Quoting
      ActiveRecord::ConnectionAdapters::MysqlAdapter.send :include, MysqlAdapter
    end
    module_function :activate!

  end
end
