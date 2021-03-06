DjengoTolkApplication::Application.routes.draw do
  

  resources :file_uploads

  devise_for :translators

  resources :translators

  resources :yml_sources do
    collection do
      get 'load_to_db'
      get '/load_to_db/:id' => 'yml_sources#load_to_db'
    end
  end

  resources :translations do 
    collection do
      get '/index_by_locale/'
      get '/index_by_locale/:id' => 'translations#index_by_locale'
    end
  end

  resources :locales do
    resources :translations
    resources :translators
  end


  resources :phrases do
    resources :translations
  end  

  resources :phrases

  resources :locales

  root :to => 'blog#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

    # resources :upload

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
