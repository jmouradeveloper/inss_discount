# frozen_string_literal: true

module InssTaxes
  module Constants
    TAX_BY_WAGE_RANGE = {
      7.5 => {
        wage_range: 0...1_045.00
      },
      9 => {
        wage_range: 1_045.01...2_089.60
      },
      12 => {
        wage_range: 2_089.61...3_134.40
      },
      14 => {
        wage_range: 3_134.41...6_101.06
      }
    }.freeze
  end
end
