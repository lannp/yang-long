require 'api_constraints'

Rails.application.routes.draw do
  namespace :admin do
  get 'orders/index'
  end

  namespace :admin do
  get 'orders/show'
  end

  namespace :admin do
  get 'orders/edit'
  end

  namespace :admin do
  get 'orders/new'
  end

  namespace :admin do
  get 'productes/index'
  end

  namespace :admin do
  get 'productes/show'
  end

  namespace :admin do
  get 'productes/edit'
  end

  namespace :admin do
  get 'productes/new'
  end

  namespace :admin do
  get 'categories/index'
  end

  namespace :admin do
  get 'categories/show'
  end

  namespace :admin do
  get 'categories/edit'
  end

  namespace :admin do
  get 'categories/new'
  end

  namespace :admin do
  get 'ui/index'
  end

  # get 'static_pages/home'

  root 'static_pages#index'

  devise_for :users

  namespace :api, defaults: { format: :json }   do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :carts, only: [:index]
      end
      resources :sessions, only: [:create, :destroy]
      resources :categories, only: [:index, :show]  do
        resources :category_nds, only: [:index, :show]
        resources :products, only: [:index]
      end
      resources :category_nds, only: [:index, :show] do
        resources :products, only: [:index]
      end
      resources :special_categories, only: [:index]
      resources :products, only: [:index, :show]
      resources :results, only: [:index]
      resources :carts, only: [:index, :update, :create, :destroy]
      resources :provincials, only: [:index]
      resources :orders, only: [:index, :create]
      resources :slides, only: [:index]
    end
  end
  get "*unmatched_route"=> 'static_pages#index'
  match '/api/*path', via: :all, to: proc { [404, {}, ['']] }
end
