Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
  confirmation: 'verification', registration: 'register', sign_up: 'sign_up' } 

  resources :clients
  resources :orders
  resources :dishes
  resources :users

  scope module: :api, path: "api" do
    resources :clients
    resources :dishes
    resources :orders
    resources :users
    resources :sessions, only: [:create]
    resources :orders, only: [:create]

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "dashboards#index"
end
