Rails.application.routes.draw do

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
  resources :articles
get 'signup', to: 'users#new'
resources :users, except: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
