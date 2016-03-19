Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
  resources :posts
  # get "posts" => 'posts#index'
  # get "posts/:id" => 'posts#show'
  # post "posts" => 'posts#create'
  # patch "posts/:id" => 'posts#update'
  # delete "posts/:id" => 'posts#delete'
  post "users" => 'registrations#create'
  get "me" => 'users#me'
  delete "me" => 'users#delete'
  end
end
