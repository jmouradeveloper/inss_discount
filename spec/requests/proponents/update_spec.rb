# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Edit Proponent', type: :request do
  let!(:proponent) { create(:proponent, name: 'Original Proponent') }
  let(:wage_value) { '12400.53' }

  subject { put proponent_path(proponent), params: proponent_params }

  context 'on success' do
    let(:proponent_params) do
      {
        proponent: {
          name: 'Edited Proponent',
          cpf: '123.456.789-10',
          birthdate: DateTime.parse('1993-05-10 10:30:14'),
          wage: wage_value
        }
      }
    end

    before { expect(UpdateWageJob).to receive(:perform_async).with(proponent.id, wage_value) }

    it do
      expect { subject }.to change { Proponent.count }.by(0)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(proponent_path(Proponent.last))

      proponent.reload
      expect(proponent.name).to eq(proponent_params[:proponent][:name])
      expect(proponent.cpf).to eq(proponent_params[:proponent][:cpf])
      expect(proponent.birthdate).to eq(proponent_params[:proponent][:birthdate])
      expect(proponent.wage).not_to eq(proponent_params[:proponent][:wage])

    end
  end
end
