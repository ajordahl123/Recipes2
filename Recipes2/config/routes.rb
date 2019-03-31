Rails.application.routes.draw do
  get 'users/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # in usage with devise, but right now there is no home for logging in
  # root to: "home#index"

  resources :recipes
  root "recipes#index"
end