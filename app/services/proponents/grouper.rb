class Proponents::Grouper
  class << self
    def by_wage_range(proponents)
      proponents.group_by { |proponent| Financial::TaxMatcher.call(wage: proponent.wage) }
    end
  end
end