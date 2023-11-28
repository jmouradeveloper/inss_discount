# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street_name { Faker::Address.street_name }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state }
    proponent
  end
end
