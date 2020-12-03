Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  root to: 'pages#home'
  resources :days, only: [:show, :new, :create, :edit, :update] do
    # route pour le days create_previous days_id/create
    post "/create_previous", to: 'days#create_previous'
  end
  resources :collections, only: :index
  resources :recipes, only: [:index, :show]
  resources :friends, only: [:index, :new, :create, :update] do
    resources :challengesets, only: [:index, :new, :create]
  end
  resources :profiles, only: [:show, :edit, :update]
end
