Rails.application.routes.draw do
  get 'home/about'
  root 'home#top'
  devise_for :users
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end