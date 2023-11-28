# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Proponent', type: :request do
  subject { post proponents_path, params: proponent_params }

  context 'on success' do
    let(:proponent_params) { { proponent: attributes_for(:proponent) } }

    it do
      expect { subject }.to change { Proponent.count }.by(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(proponent_path(Proponent.last))
    end
  end
end
