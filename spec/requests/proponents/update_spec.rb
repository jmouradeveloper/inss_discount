# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Edit Proponent', type: :request do
  let!(:proponent) { create(:proponent, name: 'Original Proponent') }
  let!(:proponent_params) { { proponent: attributes_for(:proponent) } }
  let(:wage_value) { '12400.53' }

  subject { put proponent_path(proponent), params: proponent_params }

  context 'on success' do
    before do
      expect(UpdateWageJob).to receive(:perform_async)
        .with(proponent.id, proponent_params[:proponent][:wage].to_s)
    end

    it do
      expect { subject }.to change { Proponent.count }.by(0)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(proponent_path(Proponent.last))

      proponent.reload
      expect(proponent.name).to eq(proponent_params[:proponent][:name])
      expect(proponent.cpf).to eq(proponent_params[:proponent][:cpf])
      expect(proponent.birthdate.to_date).to eq(proponent_params[:proponent][:birthdate].to_date)
      expect(proponent.wage).not_to eq(proponent_params[:proponent][:wage])
    end
  end
end
