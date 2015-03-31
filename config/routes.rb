Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :beers

  resources :beers, only: [:index, :show] do
    resources :reviews
  end

end
