# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#show'
  devise_for :users
  resources :users, only: %i[show index] do
    member do
      get :accept_request
    end
  end
  resources :posts
  resources :relationships, only: %i[create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
