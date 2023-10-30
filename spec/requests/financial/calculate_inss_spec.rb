require "rails_helper"

RSpec.describe "Calculate INSS", type: :request do
  context 'on success' do
    let(:params) { { wage: 12_000 } }

    before { post financial_calculate_inss_path, params: params }

    it do
      expect(response).to have_http_status(200)
      response_json = JSON.parse(response.body)
      expect(response_json['amount']).to eq(1200)
    end
  end
end