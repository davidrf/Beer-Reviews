Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  resources :beers, only: [:index]
end
