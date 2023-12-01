# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'proponents#index'

  resources :proponents do
    get 'report', on: :collection
  end

  post 'financial/calculate_inss', to: 'financial#calculate_inss'
end
