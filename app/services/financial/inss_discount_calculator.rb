class Financial::InssDiscountCalculator
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
      inss_value = taxes_by_wage_range.reduce(0) do |amount, (tax, value)|
        actual_max_value = value[:wage_range].last
        actual_min_value = value[:wage_range].first
        previous_max_value = last_iteration_max_value(actual_min_value)
        tax_percentage = tax_percentage(tax)

        if tax_match == tax
          break calculation_result(wage, previous_max_value, tax_percentage) + amount 
        end

        calculation_result(actual_max_value, previous_max_value, tax_percentage) + amount
      end

      inss_value.ceil(2)
    end

    def taxes_by_wage_range
      @taxes_by_wage_range ||= InssTaxes::Constants::TAX_BY_WAGE_RANGE
    end

    def last_iteration_max_value(actual_min_value)
      actual_min_value - 0.01
    end

    def tax_percentage(tax)
      tax.to_f / 100
    end

    def calculation_result(actual_max_value, previous_max_value, tax_percentage)
      ((actual_max_value.to_f - previous_max_value.to_f) * tax_percentage).to_f.floor(2)
    end
  end
end