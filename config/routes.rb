Rails.application.routes.draw do
  root 'home#index' #> RAIZ ou seja ROOT
  # get '/', to: 'home#index'
  resources :car_categories, only: [:index, :show]
  resources :manufacturers
  resources :car_models, only: [:index, :show, :new, :create]
  resources :rentals, only: [:index, :new, :create]
end