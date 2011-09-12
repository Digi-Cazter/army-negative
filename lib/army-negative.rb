require 'army-negative/version'

module Army
  module Negative

    autoload :Column,       'army-negative/column'
    autoload :Quoting,      'army-negative/quoting'
    autoload :MysqlAdapter, 'army-negative/mysql_adapter'

    #
    # Call this in an initializer in order to active army-negative and ensure
    # all true values get stored as -1 and -1's are recognized as true.
    #
    # Example:
    #   require 'army-negative'
    #   Army::Negative.activate!
    #
    def activate!
      ActiveRecord::ConnectionAdapters::Column.send       :extend,  Column
      ActiveRecord::ConnectionAdapters::Quoting.send      :include, Quoting
      ActiveRecord::ConnectionAdapters::MysqlAdapter.send :include, MysqlAdapter
    end
    module_function :activate!

  end
end
