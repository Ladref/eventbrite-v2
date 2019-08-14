Rails.application.routes.draw do
  get 'attendances/new'
  get 'attendances/index'
  devise_for :users
  root 'events#index'
  resources :events, only: [:index, :new, :create, :show]
  resources :users
  resources :attendances, only: [:new, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
