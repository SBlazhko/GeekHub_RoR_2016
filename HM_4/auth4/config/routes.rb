Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :create, :destroy]

  get 'sign_in', to: "sessions#new", as: 'sign_in'
  get 'sign_out', to: "sessions#destroy", as: 'sign_out'
  get 'sign_up', to: "users#new", as: 'sign_up'
  post 'create', to: "sessions#create", as: :sessions

  root 'sessions#new'
end
