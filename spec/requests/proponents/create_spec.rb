require "rails_helper"

RSpec.describe "Create Proponent", type: :request do
  subject { post proponents_path, params: proponent_params }

  context 'on success' do
    let(:proponent_params) { attributes_for(:proponent) }

    it { expect { subject }.to change { Proponent.count }.by(1) }
    it { expect(response).to have_http_status(:created) }
  end
end