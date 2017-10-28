Rails.application.routes.draw do
  get 'shipments/cost', to: 'shipments#shipment_cost', as: 'shipment_cost'
  get 'pages/index'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  resources :shipments
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  root to: 'pages#index'







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
