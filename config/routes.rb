Homepage::Application.routes.draw do


  devise_for :admins

  resources :projects do
    get 'refresh', to: 'projects#refresh'
  end
  resources :highlights, :except => [:index]

  namespace :dashboard do
    resources :pages, :except => [:show, :index] do
      delete ':id', to: 'pages#destroy'
    end

    resources :articles, :except => [:show] do
      get 'toggle_publish', :on => :member
    end
  end

  get 'tags/:tag', :to => 'welcome#index', :as => :tag

  resources :articles, only: [:show, :index]

  get 'pages/:id', to: 'pages#show', as: :page
  put 'pages/:id', to: 'pages#update'

  root :to => "welcome#index"
end
