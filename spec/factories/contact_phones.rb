FactoryBot.define do
  factory :contact_phone do
    number { Faker::PhoneNumber.cell_phone_in_e164 }
    contact_type { ['personal', 'work', 'reference'].sample }
    proponent
  end
end
