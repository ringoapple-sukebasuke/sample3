Rails.application.routes.draw do
  
  root 'home#index'
  get 'show', to: 'home#show'
  devise_for :users
end
