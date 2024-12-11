Rails.application.routes.draw do
  get 'bedrooms/index'
  get 'bedrooms/show'
  get 'bedrooms/new'
  get 'bedrooms/create'
  get 'bedrooms/edit'
  get 'bedrooms/update'
  get 'bedrooms/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bedrooms do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy]

  get "dashboard", to: "pages#dashboard"
end
