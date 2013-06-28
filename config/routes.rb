Homepage::Application.routes.draw do

  devise_for :admins

  resources :contacts, :except => [:edit]
  post '/contacts/:id/archive' => 'contacts#archive', as: :archive
  get '/contacts/' => 'contacts#index', as: :messages

  resources :projects
  resources :highlights, :except => [:index]
  resources :pages, :except => [:show, :index] do
    get ':id', to: 'pages#show'
    put ':id', to: 'pages#update'
    delete ':id', to: 'pages#destroy'
  end

  get 'tags/:tag', :to => 'welcome#index', :as => :tag

  resources :articles do
    get 'toggle_publish', :on => :member
  end

  root :to => "welcome#index"
end
