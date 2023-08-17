Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'

  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy] #ルーティングを一括して自動生成してくれる機能
  resources :users, only: [:index, :show, :edit, :update]
  get "home/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end