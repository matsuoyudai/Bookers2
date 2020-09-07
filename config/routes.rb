Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

  get '/search', to: 'search#search'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :books, except: [:new] do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
end