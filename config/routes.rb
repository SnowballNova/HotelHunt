Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :delete]

  root to: "pages#home"

  resources :hotels, only: [:index, :show]
  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, except: [:new, :create]

  get "dashboard", to: "pages#dashboard"
end
