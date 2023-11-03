require 'rails_helper'

RSpec.describe Financial::InssDiscountCalculator, type: :model do
  let(:wage) { '3000' }
  let(:discount) { 281.62}

  subject { Financial::InssDiscountCalculator }

  it { expect(subject.call(wage: wage)).to eq(discount) }
end
