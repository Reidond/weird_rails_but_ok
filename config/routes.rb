Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :comments
  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'
  root 'home#index'
  resources :memes
  resources :users, :only =>[:show]
  match '/users/:id',     to: 'users#show',       via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
