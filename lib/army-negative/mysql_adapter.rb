require 'set'

module Army
  module Negative
    module MysqlAdapter

      QUOTED_TRUE_AS_NEGATIVE_ONE = "-1".freeze

      def self.included(klass)
        klass.instance_eval do
          alias_method :quoted_true, :quoted_true_as_negative_one
        end
      end

      #
      # This doesn't seem to actually be necessary in rails 3.0 (though it doesn't
      # break anything either) but I'm doing this for completeness: make is so
      # that MySQL adapter-specific calls to #quoted_true also get "-1".
      #
      def quoted_true_as_negative_one
        QUOTED_TRUE_AS_NEGATIVE_ONE
      end

    end
  end
end
