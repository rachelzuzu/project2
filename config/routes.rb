Rails.application.routes.draw do

root 'site#index'

get '/search', to: 'search#index'
get '/report', to: 'search#report'


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
