Rails.application.routes.draw do

root 'site#index'

devise_for :users

  # get '/about', to: 'site#about', as: 'about'

  # get '/contact', to: 'site#contact', as: 'contact'

  # get '/users/:user_id', to: 'users#index'

  # get '/users/:user_id/log', to: 'logs#show', as: 'user_log'

  # get '/users/:user_id/log/entries', to: 'entries#index', as: 'entries'

  # post '/users/:user_id/log/entries', to: 'entries#create'

  # get '/users/:user_id/log/entries/new', to: 'entries#new', as: 'new_entry'

  # get '/users/:user_id/log/entries/:id', to: 'entries#show', as: 'entry'

  # get '/users/:user_id/log/entries/:id/edit', to: 'entries#edit', as: 'edit_entry'

  # put '/users/:user_id/log/entries/:id/update', to: 'entries#update'
  
  # delete '/users/:user_id/log/entries/:id/destroy', to: 'entries#destroy'






get "/login", to: "sessions#new"

post "/sessions", to: "sessions#create"

get "/sign_up", to: "users#new", as: "sign_up"

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
