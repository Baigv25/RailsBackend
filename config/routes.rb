Rails.application.routes.draw do
  resources :clients
  resources :orders
  resources :dishes
  resources :users

  scope module: :api, path: "api" do
    resources :clients
    resources :plates
    resources :orders
    resources :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
