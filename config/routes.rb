# frozen_string_literal: true

Rails.application.routes.draw do
  get '/elem', to: 'elem#index'
  root 'elem#index'
  get '/elem/result', to: 'elem#result'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
