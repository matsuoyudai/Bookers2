Rails.application.routes.draw do
  get 'home/about'
  root 'home#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, except: [:new] do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
end