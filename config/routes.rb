Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :user, only: [:index, :show]
  resources :post, only: [:index, :show, :new, :create, :delete]
  resources :comment, only: [:index, :show, :new, :create, :delete]

  # Routes for exceptions
  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
