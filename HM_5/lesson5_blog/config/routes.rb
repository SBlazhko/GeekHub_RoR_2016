Rails.application.routes.draw do
  root to: 'sessions#new'

  get 'sign_up', to: 'users#new'
  get 'sign_in', to: 'sessions#new', as: :sign_in
  get 'log_out', to: 'sessions#destroy', as: :log_out
  post 'create', to: 'sessions#create', as: :sessions

  resources :users do
    resources :posts
  end

  namespace :admin do
    resources :users
    delete 'destroy/:user_id', to: 'admin#destroy_user', as: 'delete_user'
    post 'set_admin_role/:user_id', to: 'admin#set_admin_role', as: 'set_role'
  end
end
