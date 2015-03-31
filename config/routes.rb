Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  resources :beers do
    resources :reviews, except: [:index, :show]
  end
end
