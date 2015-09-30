Rails.application.routes.draw do
  
   namespace :api, defaults: { format: :json } do
     match '/events', to: 'events#index', via: [:options]
     resources :events, only: [:create]
   end

  resources :registered_applications

  devise_for :users
  
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

 
end
