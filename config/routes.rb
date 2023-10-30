Rails.application.routes.draw do
  root "proponents#index"
  resources :proponents

  post 'financial/calculate_inss', to: 'financial#calculate_inss'
end
