module Army
  module Negative
    module Quoting

      #
      # Called when this module is included in
      # ActiveRecord::ConnectionAdapters::Quoting. Uses #alias_method_chain to
      # replace the original #quote method with our #quote_with_negative_one
      # variation.
      #
      def self.included(klass)
        klass.instance_eval do
          alias_method_chain :quote, :negative_one
        end
      end

      #
      # Wraps the original #quote method, ensuring that "true" values get stored
      # as -1 in the database where they'd normally have been stored as 1.
      #
      def quote_with_negative_one(value, column = nil)
        result = quote_without_negative_one(value, column)
        (value.is_a?(TrueClass) and result == '1') ? '-1' : result
      end

    end
  end
end
