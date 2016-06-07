Rails.application.routes.draw do
  get 'welcome/index'

  get 'dashboards/index'

  get 'home/index'

  devise_for :users, :controllers => {:registrations => 'users'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_scope :user do
    get "logout" => "devise/sessions#destroy", as: "logout"  
    get "login" => "devise/sessions#new", as: "login"  
    get "signup" => "devise/registrations#new", as: "signup"
    #get "dashboard" => "users#dashboard", as: "dashboard"
    get "admin"=> "users#index", as: "admin"
  end
  # You can have the root of your site routed with "root"
   root 'home#index'

 
  resources :users do
    member do
      get :approve
      put :reset_password
      get :change_password
    end
  end


  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
