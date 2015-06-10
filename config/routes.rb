
Rails.application.routes.draw do
  
  get 'goal/index'

  root 'site#index'

  get '/help', to: 'site#help', as: 'help'
  get '/about', to: 'site#about', as: 'about'
  get'/contact', to:'site#contact', as:'contact'

  #get '/search', to: 'search#index'
  #get '/report', to: 'search#report'

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

  resources :users, only: [:new, :create]

  resources :entries do 
  	resources :reports
  end

end