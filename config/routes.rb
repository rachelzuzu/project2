
Rails.application.routes.draw do


root 'site#index'

get '/help', to: 'site#help', as: 'help'

get '/about', to: 'site#about', as: 'about'

get'/contact', to:'site#contact', as:'contact'

# devise_for :users
devise_for :users do
  get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
end

resources :users do
  resources :logs do
  	resources :entries

  	# , only: [:show, :edit]
  end
end

resources :users, only:
[:new, :create]




end

     #     user_log_charts GET    /users/:user_id/logs/:log_id/charts(.:format)           charts#index
     #                     POST   /users/:user_id/logs/:log_id/charts(.:format)           charts#create
     #  new_user_log_chart GET    /users/:user_id/logs/:log_id/charts/new(.:format)       charts#new
     # edit_user_log_chart GET    /users/:user_id/logs/:log_id/charts/:id/edit(.:format)  charts#edit
     #      user_log_chart GET    /users/:user_id/logs/:log_id/charts/:id(.:format)       charts#show
     #                     PATCH  /users/:user_id/logs/:log_id/charts/:id(.:format)       charts#update
     #                     PUT    /users/:user_id/logs/:log_id/charts/:id(.:format)       charts#update
     #                     DELETE /users/:user_id/logs/:log_id/charts/:id(.:format)       charts#destroy
