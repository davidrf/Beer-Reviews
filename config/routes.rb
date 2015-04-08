Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  resources :beers

  resources :beers do
    resources :reviews, only: [:new, :create, :edit, :update]
    resources :breweries, only: [:show]
  end

  resources :reviews, only: [:destroy]

end
