Rails.application.routes.draw do

  get 'accept_user_input' => 'dashboard#index'
  post 'submit_user_input' => 'dashboard#submit'

  resources :foods
end
