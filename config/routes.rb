Rails.application.routes.draw do
  post "likes/:company_id/create" => "likes#create"
  post "likes/:company_id/destroy" => "likes#destroy"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root 'home#top'
  get 'index', to: 'home#index'
  get 'show', to: 'home#show'
  resources :companys do
    resources :comments, only: [:create]
  end
end
