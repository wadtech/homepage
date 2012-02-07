Homepage::Application.routes.draw do

  devise_for :admins
  resources :contact_us
  resources :articles do  
    get 'toggle_publish', :on => :member  
  end  

  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

end
