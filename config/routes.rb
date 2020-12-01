Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :days, only: [:show, :new, :create, :edit, :update]
    resources :collections, only: :index
    resources :recipes, only: [:index, :show]
    resources :friends, only: [:index, :new, :create, :update] do
      resources :challengesets, only: [:index, :new, :create]
    end
    resources :profiles, only: [:show, :edit, :update]
end
