Personalwebsite::Application.routes.draw do

  devise_for :admins , :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :posts , only:[:show , :index]
  resources :tag , only: [:show , :index]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "/" => "static_pages#index", :as => "root"
  # You can have the root of your site routed with "root"
  get "static_pages#about" , :controller => "static_pages" , :action => "about" , :as => "about"

  namespace :backend do
     devise_for :admins
      get "admin_index/index"
   root 'admin_index#index'
   resources :posts
   post "posts/:id/preview" => "posts#preview"
   delete "posts/destroy" , to: 'posts#destroy'
   resources :tags 
    
    
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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
