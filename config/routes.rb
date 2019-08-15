Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users
  resources :charges
  resources :attendances, only: [:new, :index, :create]
  resources :events do
    resources :attendances, only: [:new, :index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
