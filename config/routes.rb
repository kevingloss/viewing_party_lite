# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  resources :users do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end
end
