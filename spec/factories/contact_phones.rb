# frozen_string_literal: true

FactoryBot.define do
  factory :contact_phone do
    number { Faker::PhoneNumber.cell_phone_in_e164 }
    contact_type { %w[personal work reference].sample }
    proponent
  end
end
