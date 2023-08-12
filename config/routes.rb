Rails.application.routes.draw do


  root to: 'homes#top'

  get "/home/about" => "homes#about", as: "about"

  devise_for :users

  resources :users, only: [:index,:show, :update, :edit]

  resources :books, only: [:new, :create, :index, :show, :update, :edit, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
