Rails.application.routes.draw do

  root 'welcome#home'
  get 'welcome/about'
  # get 'dogs/index'
  # get 'dogs/show'
  # get 'dogs/new'
  # get 'dogs/edit'
  resources :dogs
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
