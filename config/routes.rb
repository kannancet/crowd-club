CrowdClubWeb::Application.routes.draw do

=begin
  Authentication routes goes here. 
=end   
   devise_for :users, :controllers => { :sessions => "users/sessions" , :registrations => "users/registrations"}
   devise_scope :user do
     get "sign_in", :to => "users/sessions#new"
     get "users/sign_out", :to => "users/sessions#destroy"
     match "/user/sign_up", :to => "users/registrations#sign_up"
     get "forgot_password", :to => "users/sessions#forgot_password"
     post "recover_password", :to => "users/sessions#recover_password"
     match "/update_password/:id", :to => "users/sessions#update_password", :via => :post, :as => :update_password
     match "/users/edit_password/:id" => "users/sessions#edit_password", :via => :get, :as => :edit_password
     match "/crowdclub/users/activate_account/(:confirmation_token)" => "users/registrations#activate_account", :via => :get, :as => :user_account_activation
     post "verify_account_confirmation", :to => "users/sessions#verify_account_confirmation"
   end
  
=begin
  Here goes routes for me tab. 
=end
  resources :me do
    collection do
      get 'index'
      get 'my_map'
      post 'update_my_location'
      get 'edit_user_info'
    end
  end
  match 'upload_feed_image', :to => "me#upload_feed_image"
  match 'set_user_location', :to => "me#set_user_location"
  
=begin
  Here goes routes for me tab. 
=end  
  resources :explore do
    collection do
      get 'index'
    end
  end
  
=begin
  Here goes routes for me tab. 
=end  
  resources :feeds do
    collection do
      get 'index'
    end
  end
  
=begin
  Here goes routes for me tab. 
=end  
  resources :buddies do
    collection do
      get 'index'
    end
  end

  root :to => "me#set_user_location"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
