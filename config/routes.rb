Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'

  get '/search', to: 'search#search'

  resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
  	resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
end