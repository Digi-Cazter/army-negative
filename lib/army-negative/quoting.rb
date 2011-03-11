module Army
  module Negative
    module Quoting

      #
      # Extend ActiveRecord::ConnectionAdapters::Quoting
      #
      def self.included(klass)
        klass.instance_eval do
          alias_method_chain :quote, :negative_one
        end
      end

      #
      # Ensure "true" values get stored as -1 in the database where they'd
      # normally have been stored as 1
      #
      def quote_with_negative_one(value, column = nil)
        result = quote_without_negative_one(value, column)
        (value.is_a?(TrueClass) and result == '1') ? '-1' : result
      end

    end
  end
end
