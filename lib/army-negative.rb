require 'army-negative/railtie' if defined?(Rails)

module Army
  module Negative

    autoload :Column,       'army-negative/column'
    autoload :Quoting,      'army-negative/quoting'
    autoload :MysqlAdapter, 'army-negative/mysql_adapter'

    def patch_active_record!
      ActiveRecord::ConnectionAdapters::Column.send  :include, Column
      ActiveRecord::ConnectionAdapters::Quoting.send :include, Quoting
    end
    module_function :patch_active_record!

    def patch_mysql_adapter!
      require 'active_record/connection_adapters/mysql_adapter'
      ActiveRecord::ConnectionAdapters::MysqlAdapter.send :include, MysqlAdapter
    end
    module_function :patch_mysql_adapter!

  end
end
