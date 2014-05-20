Rails.application.routes.draw do

  root 'foodlists#index'
  resources :foodlists
  devise_for :users
end
