Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    get "posts" => 'posts#index'
  end
end
