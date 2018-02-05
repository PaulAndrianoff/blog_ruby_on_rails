Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :user, only: [:index, :show]
  resources :post, only: [:index, :show, :new, :create, :delete]
  resources :comment, only: [:index, :show, :new, :create, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
