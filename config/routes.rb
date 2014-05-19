Rails.application.routes.draw do

  root 'shoppinglists#index'
  devise_for :users
  resources :shoppinglists
end
