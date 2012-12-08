Homepage::Application.routes.draw do

  devise_for :admins
  
  resources :contacts, :except => [:edit]
  post '/contacts/:id/archive' => 'contacts#archive', as: :archive
  get '/contacts/' => 'contacts#index', as: :messages

  resources :projects
  resources :highlights, :except => [:index]
  resources :pages, :except => [:show, :index] 

  get 'tags/:tag', :to => 'welcome#index', :as => :tag

  resources :articles do  
    get 'toggle_publish', :on => :member
  end

  root :to => "welcome#index"

  get ':id', to: 'pages#show', :as => :page
  put ':id', to: 'pages#update'
  delete ':id', to: 'pages#destroy'

  # See how all your routes lay out with "rake routes"

end
