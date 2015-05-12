Rails.application.routes.draw do

root 'site#index'

devise_for :users



resources :users do
  resources :logs do
  resources :entries
  end
end

resources :users, only:
[:new, :create]




end
