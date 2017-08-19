Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get '/history', to: 'home#history'
  resources :matches, only: [:new, :create]
end
