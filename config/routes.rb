Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  # get "home/about"=>"homes#about"
  get 'home/about' => 'homes#about', as: 'about'
  # get 'home/about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
