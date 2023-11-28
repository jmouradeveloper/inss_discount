# frozen_string_literal: true

module Financial
  class TaxMatcher
    class << self
      def call(wage:)
        taxes_by_wage_range.find do |tax, range|
          tax if range[:wage_range].member?(wage) || last_range?(tax)
        end
          .first
      end

      private

      def taxes_by_wage_range
        @taxes_by_wage_range ||= InssTaxes::Constants::TAX_BY_WAGE_RANGE
      end

      def last_range?(tax)
        tax == taxes_by_wage_range.keys.last
      end
    end
  end
end
