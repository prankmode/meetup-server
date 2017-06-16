# frozen_string_literal: true
Rails.application.routes.draw do
  resources :meetups
  post 'meetups_multiple' => 'meetups#multiple'
  get '/search' => 'meetups#search'
  post '/meetups/:id' => 'meetups#create_id'

  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  patch '/email/:id' => 'users#add_verified_email'
  resources :users, only: [:index, :show]
end
