Homepage::Application.routes.draw do
  devise_for :admins

  resources :highlights, :except => [:index]

  namespace :dashboard do
    resources :projects, :except => [:index, :show] do
      get 'refresh', to: 'projects#refresh'
    end

    resources :pages, :except => [:show, :index] do
      delete ':id', to: 'pages#destroy'
    end

    resources :articles, :except => [:show] do
      get 'toggle_publish', :on => :member
    end

    root to: "dashboard#index"
  end

  resources :projects, only: [:index, :show]

  get 'tags/:tag', :to => 'welcome#index', :as => :tag

  resources :articles, only: [:show, :index]

  put 'pages/:id', to: 'pages#update'
  get '/:id', to: 'pages#show', as: :page

  root :to => "welcome#index"
end
