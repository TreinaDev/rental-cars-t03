Rails.application.routes.draw do
  root 'home#index' #> RAIZ ou seja ROOT
  # get '/', to: 'home#index'
  resources :car_categories, only: [:index]
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
end