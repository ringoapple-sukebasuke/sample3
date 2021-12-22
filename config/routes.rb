Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'show', to: 'home#show'
end
