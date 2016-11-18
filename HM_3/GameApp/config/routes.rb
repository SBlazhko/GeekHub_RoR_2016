Rails.application.routes.draw do
  
  resources :gamess
  root "gamess#index"
end
