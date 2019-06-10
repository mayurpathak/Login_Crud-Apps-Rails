Rails.application.routes.draw do


  # get 'password_resets/new'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/_form'
  # get 'users/update'
  root 'welcome#home'
  get 'welcome/about'
  # get 'dogs/index'
  # get 'dogs/show'
  # get 'dogs/new'
  # get 'dogs/edit'
  #resources :dogs
  get '/:token/forgot_password/', :to => "password_resets#edit_user"
  resources :password_resets
  resources :articles
get 'signup', to: 'users#new'
resources :users, except: [:new]
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destory'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
