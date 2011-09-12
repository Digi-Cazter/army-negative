module Army
  module Negative
    module Column

      # Augments ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES
      TRUE_VALUES_WITH_NEGATIVE_ONES = [-1, '-1']

      #
      # Called when you extend ActiveRecord::ConnectionAdapters::Column with
      # this module. Uses #alias_method_chain so that
      # #value_to_boolean_with_negative_ones is called instead of
      # #value_to_boolean
      #
      def self.extended(klass)
        klass.instance_eval do
          class << self
            alias_method_chain :value_to_boolean, :negative_ones
          end
        end
      end

      #
      # Replaces #value_to_boolean in order to recognize integer -1 and string
      # '-1' as "true" values.
      #
      def value_to_boolean_with_negative_ones(value)
        return true if TRUE_VALUES_WITH_NEGATIVE_ONES.include?(value)
        value_to_boolean_without_negative_ones(value)
      end

    end
  end
end
