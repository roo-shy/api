Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    get "posts" => 'posts#index'
    get "posts/:id" => 'posts#show'
    post "posts" => 'posts#create'
    patch "posts/:id" => 'posts#update'
    delete "posts/:id" => 'posts#delete'
    post "registrations" => 'registrations#create'
  end
end
