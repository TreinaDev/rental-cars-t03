Rails.application.routes.draw do
  devise_for :users
  root 'home#index' #> RAIZ ou seja ROOT
  # get '/', to: 'home#index'
  resources :car_categories, only: [:index, :show]
  resources :manufacturers
  resources :car_models, only: [:index, :show, :new, :create]
  resources :rentals, only: %i[index show new create] do
    get 'search', on: :collection
    resources :car_rentals, only: [:new, :create]
  end
  resources :customers, only: %i[index show] do
    get 'search', on: :collection
  end
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :cars, only: %i[index]
    end
  end
end