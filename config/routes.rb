Rails.application.routes.draw do
  root to:'homes#top'
  devise_for :users
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:index, :show] #ルーティングを一括して自動生成してくれる機能
  resources :users, only: [:index, :show, :edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
