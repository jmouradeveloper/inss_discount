# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent, type: :model do
  describe 'associations' do
    it { should have_one(:address).class_name('Address') }
    it { should have_many(:contact_phones).class_name('ContactPhone') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_length_of(:cpf).is_equal_to(14) }
  end
end
