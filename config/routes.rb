Rails.application.routes.draw do
  devise_for :users

  root to: 'site#index'
  get '/about', to: 'site#about', as: 'about'
  get '/contact', to: 'site#contact', as: 'contact'

  get '/users/:user_id', to: 'users#index'
  get '/users/:user_id/log', to: 'logs#show', as: 'user_log'

  get '/users/:user_id/log/entries', to: 'entries#index', as: 'entries'
  post '/users/:user_id/log/entries', to: 'entries#create'
  get '/users/:user_id/log/entries/new', to: 'entries#new', as: 'new_entry'
  get '/users/:user_id/log/entries/:id', to: 'entries#show', as: 'entry'
  get '/users/:user_id/log/entries/:id/edit', to: 'entries#edit', as: 'edit_entry'
  put '/users/:user_id/log/entries/:id/update', to: 'entries#update'
  delete '/users/:user_id/log/entries/:id/destroy', to: 'entries#destroy'

=begin
  Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
            user_session POST   /users/sign_in(.:format)       devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration POST   /users(.:format)               devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                         PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
                    root GET    /                              site#index
                   about GET    /about(.:format)               site#about
                 contact GET    /contact(.:format)             site#contact
=end


end
