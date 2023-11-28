# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactPhone, type: :model do
  describe 'associations' do
    it { should belong_to(:proponent).class_name('Proponent') }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:contact_type) }
  end
end
