# frozen_string_literal: true

Rails.application.routes.draw do
  root 'proponents#index'

  resources :proponents do
    get 'report', on: :collection
  end

  post 'financial/calculate_inss', to: 'financial#calculate_inss'
end
