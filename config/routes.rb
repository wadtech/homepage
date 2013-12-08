Homepage::Application.routes.draw do

  devise_for :admins
  devise_scope :admin do
    get "/login" => "devise/sessions#new"
  end

  resources :projects
  resources :highlights, :except => [:index]
  resources :pages, :except => [:show, :index] do
    delete ':id', to: 'pages#destroy'
  end

  get 'tags/:tag', :to => 'welcome#index', :as => :tag

  resources :articles do
    get 'toggle_publish', :on => :member
  end

  get 'pages/:id', to: 'pages#show'
  put 'pages/:id', to: 'pages#update'

  root :to => "welcome#index"
end
