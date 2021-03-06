Rails.application.routes.draw do
  resource :members, only: [:show, :edit, :update]
  patch "/members/hide" => "members#hide", as: 'members_hide'
  get "/members/withdraw" => "members#withdraw", as: "member_withdraw"
  devise_for :members
  root to: 'homes#top'
  get "home/about" => "homes#about"
  get "/managers" => "managers/homes#top"

  resources :products, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :create, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  resources :orders, only: [:new, :create, :index, :show,]do
    collection do
      post 'confirm'
      get 'complete'
    end
  end

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
  resources :orders, only: [:show, :update] do
    resources :order_details,only: [:update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
