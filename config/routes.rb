Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/new'
  root "recipes#index"
  devise_for :users
  resources :users
  resources :recipes do
    resources :reviews, :only => [:create, :new]
  end

end
