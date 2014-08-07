Clinify::Application.routes.draw do
  
  resources :events
  devise_for :users, :path_prefix => 'dev'
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :users
  resources :records

  root  'clinify_static_pages#home'
  match '/help',    to: 'clinify_static_pages#help',    via: 'get'
  match '/about',   to: 'clinify_static_pages#about',   via: 'get'
  match '/login',   to: 'clinify_static_pages#login', via: 'get'

end
