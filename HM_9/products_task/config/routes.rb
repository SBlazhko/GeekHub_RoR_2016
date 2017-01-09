Rails.application.routes.draw do

  root "products#index"
  resources :products, except: [:edit, :update, :show]
  get "export_products", to: "products#export", format: true, defaults: { format: :csv }
  post "import_products", to: "products#import"
end
