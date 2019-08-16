Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users
  resources :charges
  resources :attendances, only: [:new, :index, :create]
  resources :events do
    resources :attendances, only: [:new, :index, :create]
  end
  namespace :admin do
    resources :users
  end

  authenticated :user, ->(u) { u.isAdmin?(:true) } do
    root to: "admin#index", as: :admin_root
  end

  authenticated :user, ->(u) { u.isAdmin?(:false) } do
    root to: "events#index", as: :user_root
  end

  root to: "devise/sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
