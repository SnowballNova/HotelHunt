Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :hotels do
    resources :rooms, only: [:new, :create]
  end

  resources :rooms do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]

  get "dashboard", to: "pages#dashboard"
end
