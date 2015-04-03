Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  resources :beers

  resources :reviews, only: [:destroy]

  resources :beers do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  resources :reviews do
    resources :downvotes
  end

  resources :reviews do
    resources :upvotes
  end

end
