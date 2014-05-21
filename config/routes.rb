Rails.application.routes.draw do

  root 'dashboard#index'
  devise_for :users
  get 'accept_user_input' => 'dashboard#index'
  post 'submit_user_input' => 'dashboard#submit'

  resources :foods do
    resources :shopping_list_food_relations
  end

  resources :shopping_lists

end
