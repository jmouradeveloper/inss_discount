# frozen_string_literal: true

module Proponents
  class Grouper
    class << self
      def by_wage_range(proponents)
        proponents.group_by { |proponent| Financial::TaxMatcher.call(wage: proponent.wage) }
      end
    end
  end
end
