Rails.application.routes.draw do

  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'sign_in', to: 'sessions#new', as: :sign_in
  get 'sign_out', to: 'sessions#destroy', as: :log_out
  post 'create', to: 'sessions#create', as: :sessions

  root 'sessions#new'
  get 'posts/index',to: 'posts#index'
  get 'posts/my_posts', to: 'posts#my_posts', as: 'posts/my_post'
  
  resources :users, only: [:show, :create] do 
    resources :posts, except: [:index]
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :posts, only: [:index]
  end

  delete 'destroy/:user_id', to: 'users#destroy', as: 'delete_user'
  put 'set_admin/:user_id', to: 'users#set_admin', as: 'set_admin'

end
