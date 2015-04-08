Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  resources :beers

  resources :reviews do
    resources :downvotes, only: [:create]
    resources :upvotes, only: [:create]
  end

  resources :beers do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :styles, only: [:index, :show]
end
