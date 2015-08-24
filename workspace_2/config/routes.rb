Rails.application.routes.draw do
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'
  get :member_stories, to: 'writings#index'
  get :write_story, to: 'writings#new'
  resources :sessions
  resources :writings
  resources :tales
  resources :members
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
root 'tales#index'
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
get 'members'=>'members#index'
get 'admin/index'
get 'about' => 'tales#about'
get 'all' => 'tales#all'
get 'tales/all' => 'tales#all'
get 'filter'=>'tales#filter'
get 'longest' => 'tales#longest'
get 'shortest' => 'tales#shortest'
get 'recently_added' => 'tales#recently_added'
get 'oldest' => 'tales#oldest'
get 'fail' => 'tales#fail'
get 'login' => 'tales#login'
get 'access' => 'tales#access'
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
