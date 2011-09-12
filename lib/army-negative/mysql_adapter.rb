module Army
  module Negative
    module MysqlAdapter

      # Effectively replaces ActiveRecord::ConnectionAdapters::MysqlAdapter::QUOTED_TRUE
      QUOTED_TRUE_AS_NEGATIVE_ONE = "-1".freeze

      #
      # Called when this module is included in
      # ActiveRecord::ConnectionAdapters::MysqlAdapter. Uses #alias_method to
      # replace the original #quoted_true implementation with this module's
      # implementation named #quoted_true_as_negative_one
      #
      def self.included(klass)
        klass.instance_eval do
          alias_method :quoted_true, :quoted_true_as_negative_one
        end
      end

      #
      # Replaces the original #quoted_true implementation. When asked for a
      # "quoted_true" value, return our variation (QUOTED_TRUE_AS_NEGATIVE_ONE)
      # instead of the default QUOTED_TRUE value.
      #
      def quoted_true_as_negative_one
        QUOTED_TRUE_AS_NEGATIVE_ONE
      end

    end
  end
end
