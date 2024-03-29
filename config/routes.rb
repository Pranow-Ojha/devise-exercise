Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :path => 'onepage', :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords", :unlocks => "users/unlocks"}, :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}
  get "home/list_of_users"
  post "home/list_of_users"
  get "home/remove_user"
  post "home/remove_user"
  patch "home/remove_user"
  get "home/new_user_register"
  get "home/new_user_register"
  get "home/new_user_register"
  get "home/save_user"
  post "home/save_user"
  patch "home/save_user"
  get 'home/admin_landing_page'
  get 'home/end_user_landing_page'
  get 'home/list_of_end_users'
  post 'home/list_of_end_users'



  get '*unmatched_route', :to => redirect('/')
  post '*unmatched_route', :to => redirect('/')
  patch '*unmatched_route', :to => redirect('/')

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
