Rails.application.routes.draw do
  
  devise_for :users

  resources :users

  root 'buckets#index'

  get 'buckets/home' => 'buckets#home'
  get 'buckets/show_archive' => 'buckets#show_archive', as: 'bucket_show_archive'
  get 'buckets/show_public' => 'buckets#show_public', as: 'bucket_show_public'
  get 'buckets/show_private' => 'buckets#show_private', as: 'bucket_show_private'
  get 'buckets/show_group' => 'buckets#show_group', as: 'bucket_show_group'
  get 'buckets/show_following' => 'buckets#show_following', as: 'bucket_show_following'
  patch 'buckets/:id/archive' => 'buckets#archive', as: 'bucket_archive'
  patch 'buckets/:bucket_id/items/:id/status' => 'items#status', as: 'bucket_item_status'
  
  resources :buckets do
    resources :items do
      resources :attendances, only: [:create]
      delete 'attendances' => 'attendances#destroy'
    end
    resources :bucket_ownerships, only: [:index, :create]
    delete 'bucket_ownerships' => 'bucket_ownerships#destroy'
    get 'update_hashtags' => 'hashtags#update', as: 'update_hashtags'
  end

  resources :hashtags, only: [:show]



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
