Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/new'
  #get 'users/new'
  root "recipes#index"
  devise_for :users
  resources :recipes do
    resources :reviews, :only => [:create, :new]
  end

end