require 'set'

module Army
  module Negative
    module Column
      TRUE_VALUES_WITH_NEGATIVE_ONES = [-1, '-1'].to_set

      #
      # Extend ActiveRecord::ConnectionAdapters::Column
      #
      def self.included(klass)
        klass.send(:extend, ClassMethods)
        klass.instance_eval do
          class << self
            alias_method_chain :value_to_boolean, :negative_ones
          end
        end
      end

      module ClassMethods
        #
        # Recognize integer -1 and string '-1' as "true" values.
        #
        def value_to_boolean_with_negative_ones(value)
          return true if TRUE_VALUES_WITH_NEGATIVE_ONES.include?(value)
          value_to_boolean_without_negative_ones(value)
        end
      end

    end
  end
end
