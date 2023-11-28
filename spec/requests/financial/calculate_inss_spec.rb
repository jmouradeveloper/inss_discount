# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Calculate INSS', type: :request do
  context 'on success' do
    let(:wage) { '3000' }

    before do
      expect(Financial::InssDiscountCalculator).to receive(:call).with(wage:).and_return(281.62)
      post financial_calculate_inss_path, params: { wage: }
    end

    it do
      expect(response).to have_http_status(200)
      response_json = JSON.parse(response.body)
      expect(response_json['amount']).to eq(281.62)
    end
  end
end
