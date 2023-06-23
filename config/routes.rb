Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy] do
      resources :likes, only: [:index, :create, :new]
      resources :comments, only: [:index, :create, :new, :destroy]
    end
  end
  namespace :api do
    namespace :v1 do
      get "users/:id", to: "users#user_posts"
      get "users/:id/:post_id", to: "users#post_comments"
      post "users/:id/:post_id", to: "users#create_comments"
    end
  end
end
