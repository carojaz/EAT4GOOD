Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :days, only: [:show, :new, :create, :edit, :update] do
    # route pour le days create_previous days_id/create
    get "/create_previous", to: 'days#create_previous'
    get "/next_day", to: 'days#next_day'
  end
  get "create", to: 'days#create', as: :create_day
  resources :collections, only: [:index, :show]
  resources :recipes, only: [:index, :show]
  resources :friends, only: [:index, :new, :create, :update] do
    resources :challengesets, only: [:index, :new, :create]
  end
  resources :profiles, only: [:show, :edit, :update]
  resources :objectives, only: [:update]
end
