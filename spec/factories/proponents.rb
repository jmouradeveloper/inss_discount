FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    birthdate { Faker::Time.between(from: 60.years.ago, to: 18.years.ago) }
    wage { Faker::Number.decimal(l_digits: 4) }
  end
end
