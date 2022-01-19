Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'index', to: 'home#index'
  get 'show', to: 'home#show'
  resources :posts
  resources :companys do
    resources :comments, only: [:create]
  end
end
