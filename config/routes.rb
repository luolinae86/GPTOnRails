# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'chats#new'

  resources :chats, only: %i[new create] do
    resources :messages, only: %i[create]
  end

end
