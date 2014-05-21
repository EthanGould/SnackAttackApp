Rails.application.routes.draw do

  devise_for :users
  get 'accept_user_input' => 'dashboard#index'
  post 'submit_user_input' => 'dashboard#submit'

  resources :foods
end
