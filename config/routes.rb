Rails.application.routes.draw do

devise_for :members
devise_for :admin
#devise_for :admin, controllers: {
  #sessions: "admin/sessions"
#}

  resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
    resources :comments, only: [:create, :destroy,:index]
  end

  resources :members, only: [:show, :edit, :update]

  namespace :admin do
    resources :posts, only: [:index, :destroy]
    resources :members, only: [:index, :destroy]
  end


root to: "homes#top"

get "/home/about" => "homes#about", as: "about"
get "/search" => "posts#search", as: "search_path"
end
