Rails.application.routes.draw do
  resources :categories
post "packages/:id/bundles/:id/edit"    => "bundles#edit" 

  resources :bundles
  resources :frequencies
  resources :packages 
  resource :session
  get 'signup' => 'users#new'
  resources :users
  resources :products 
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"
end