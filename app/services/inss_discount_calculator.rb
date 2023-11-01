class InssDiscountCalculator
  class << self
    def call(wage:)
      wage = wage.to_f
      tax_match = tax_match(wage)

      calculate_inss(wage, tax_match)
    end

    private

    def tax_match(wage)
      taxes_by_wage_range.map do |range|
        break range.first if range.second[:wage_range].member?(wage)
      end
    end

    def calculate_inss(wage, tax_match)
      taxes_by_wage_range.reduce(0) do |amount, (tax, value)|
        max_wage_in_range = value[:wage_range].last
        min_wage_in_range = value[:wage_range].first

        tax_percentage = tax / 100

        if tax_match == tax
          break amount + (wage - max_wage_in_range) * tax_percentage
        end

        amount + ((max_wage_in_range - min_wage_in_range) * tax_percentage)
      end
    end

    def taxes_by_wage_range
      @taxes_by_wage_range ||= InssTaxes::Constants::TAX_BY_WAGE_RANGE
    end
  end
end