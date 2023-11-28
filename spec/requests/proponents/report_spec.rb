# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Report Proponent List', type: :request do
  context 'on success' do
    before do
      create_list(:proponent, 10)
      get report_proponents_path
    end

    it { should render_template('report') }
    it { expect(response).to have_http_status(:ok) }
    it { expect(assigns(:proponents_by_wage_rage)).to be_truthy }
  end
end
