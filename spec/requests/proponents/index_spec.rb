# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List Proponent', type: :request do
  context 'on success' do
    let(:default_per_page) { 5 }
    let(:three_pages_of_proponents) { (default_per_page * 2) + 1 }

    before do
      create_list(:proponent, three_pages_of_proponents)
      get proponents_path
    end

    it { should render_template('index') }
    it { expect(response).to have_http_status(:ok) }
    it { expect(assigns(:proponents).count).to eq(default_per_page) }
  end
end
