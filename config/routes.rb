Rails.application.routes.draw do

root 'site#index'

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
#  root GET    /                                                       site#index
#         new_user_session GET    /users/sign_in(.:format)                                devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                                devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                               devise/sessions#destroy
#            user_password POST   /users/password(.:format)                               devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                           devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                          devise/passwords#edit
#                          PATCH  /users/password(.:format)                               devise/passwords#update
#                          PUT    /users/password(.:format)                               devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                 devise/registrations#cancel
#        user_registration POST   /users(.:format)                                        devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                                devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                   devise/registrations#edit
#                          PATCH  /users(.:format)                                        devise/registrations#update
#                          PUT    /users(.:format)                                        devise/registrations#update
#                          DELETE /users(.:format)                                        devise/registrations#destroy
#         user_log_entries GET    /users/:user_id/logs/:log_id/entries(.:format)          entries#index
#                          POST   /users/:user_id/logs/:log_id/entries(.:format)          entries#create
#       new_user_log_entry GET    /users/:user_id/logs/:log_id/entries/new(.:format)      entries#new
#      edit_user_log_entry GET    /users/:user_id/logs/:log_id/entries/:id/edit(.:format) entries#edit
#           user_log_entry GET    /users/:user_id/logs/:log_id/entries/:id(.:format)      entries#show
#                          PATCH  /users/:user_id/logs/:log_id/entries/:id(.:format)      entries#update
#                          PUT    /users/:user_id/logs/:log_id/entries/:id(.:format)      entries#update
#                          DELETE /users/:user_id/logs/:log_id/entries/:id(.:format)      entries#destroy
#                user_logs GET    /users/:user_id/logs(.:format)                          logs#index
#                          POST   /users/:user_id/logs(.:format)                          logs#create
#             new_user_log GET    /users/:user_id/logs/new(.:format)                      logs#new
#            edit_user_log GET    /users/:user_id/logs/:id/edit(.:format)                 logs#edit
#                 user_log GET    /users/:user_id/logs/:id(.:format)                      logs#show
#                          PATCH  /users/:user_id/logs/:id(.:format)                      logs#update
#                          PUT    /users/:user_id/logs/:id(.:format)                      logs#update
#                          DELETE /users/:user_id/logs/:id(.:format)                      logs#destroy
#                    users GET    /users(.:format)                                        users#index
#                          POST   /users(.:format)                                        users#create
#                 new_user GET    /users/new(.:format)                                    users#new
#                edit_user GET    /users/:id/edit(.:format)                               users#edit
#                     user GET    /users/:id(.:format)                                    users#show
#                          PATCH  /users/:id(.:format)                                    users#update
#                          PUT    /users/:id(.:format)                                    users#update
#                          DELETE /users/:id(.:format)                                    users#destroy
#                          POST   /users(.:format)                                        users#create
#                          GET    /users/new(.:format)                                    users#new



end
