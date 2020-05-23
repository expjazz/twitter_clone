# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#show'
  devise_for :users
  resources :users, only: %i[show index] do
    member do
      get :accept_request
    end
  end
  resources :posts do
    resources :comments
    member do
      get :likes
    end
  end
  resources :relationships, only: %i[create]
  get 'search_post', to: 'welcome#search'
  get 'search_user', to: 'users#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
