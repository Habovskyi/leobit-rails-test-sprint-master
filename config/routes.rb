# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'films#index'

  resources :actors, only: %i[index show new create destroy]
  resources :films, only: %i[index show create destroy] do
    scope module: :films do
      resources :reviews, only: %i[create]
    end
  end

  resources :reviews, only: :destroy
end
