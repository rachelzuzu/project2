# this is cristina's branch
#another test

Rails.application.routes.draw do

root 'site#index'

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  devise_for :users


resources :users do
	resources :logs do
	resources :entries
	end
end

resources :logs do
	resources :entries
end

resources :entries

resources :users, only:
[:new, :create]




end
