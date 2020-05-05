Rails.application.routes.draw do
  devise_for :users
  root 'home#index' #> RAIZ ou seja ROOT
  # get '/', to: 'home#index'
  resources :car_categories, only: [:index, :show]
  resources :manufacturers
  resources :car_models, only: [:index, :show, :new, :create]
  resources :rentals, only: [:index, :new, :create] do
    get 'search', on: :collection
  end
  resources :customers, only: [:index] do
    get 'search', on: :collection
  end
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
end
