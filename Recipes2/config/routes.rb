Rails.application.routes.draw do
  #get 'users/new'
  root "recipes#index"
  devise_for :users
  resources :recipes, :reviews
end
