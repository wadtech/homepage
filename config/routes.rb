Homepage::Application.routes.draw do

  devise_for :admins
  
  match 'contact', :to => 'contacts#new'
  resources :contacts, :projects
  resources :highlights, :except => [:index]
  resources :pages, :except => [:show, :index] 

  resources :articles do  
    get 'toggle_publish', :on => :member  
  end

  root :to => "welcome#index"

  get ':id', to: 'pages#show', as: :page
  put ':id', to: 'pages#update'
  delete ':id', to: 'pages#destroy'

  # See how all your routes lay out with "rake routes"

end
