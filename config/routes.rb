Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    get "posts" => 'posts#index'
    get "posts/:id" => 'posts#show'
    post "registrations" => 'registrations#create'
  end
end
