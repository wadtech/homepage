Homepage::Application.routes.draw do

  devise_for :admins
  
  match 'contact', :to => 'contacts#new'
  resources :contacts

  resources :articles do  
    get 'toggle_publish', :on => :member  
  end  

  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

end
