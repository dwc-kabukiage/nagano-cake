Rails.application.routes.draw do
  devise_for :members
  root to: 'homes#top'
  get "home/about" => "homes#about"
  get "/managers" => "managers/homes#top"
  
  resources :products, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :create, :destroy]
  resources :orders, only: [:new, :create, :index, :show,]
  resources :members, only: [:show, :withdraw, :hide, :edit, :update]
  put "/members/:id/hide" => "members#hide", as: 'members_hide'

  resources :deliveries, only: [:index, :edit, :update, :create, :destroy]
  
  devise_for :managers, controllers: {
  sessions: 'managers/sessions',
  passwords: 'managers/passwords',
  registrations: 'managers/registrations'
  }
  namespace :managers do
  resources :products, only: [:index, :new, :create, :show, :update, :edit]
  resources :categories, only: [:index, :create, :update, :edit]
  resources :members, only: [:index, :show, :update, :edit]
  resources :orders, only: [:show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
