Scamazon::Application.routes.draw do

 
  # #this is for entering data for your purchase
  # get 'purchases/new' => 'purchases#new'
  # #this is where you review your page before you finalize the purchase
  resources :orders, :users
  resources :reviews, except: [:show, :index, :edit, :new]
  resources :sessions
  resources :products
  resources :purchases
  resources :categories


  get  'cart'                         => 'orders#cart'
  get  'fulfillment'                  => 'orders#fulfillment'
  get  'shipped'                      => 'orders#shipped'
  get  'paid'                         => 'orders#paid'
  get  'pending'                      => 'orders#pending'
  get  'products/category'            => 'products#category'
  post 'products/category'            => 'products#category'
  post 'purchases/new'                => 'purchases#new'
  post 'purchases/create'             => 'purchases#create'
  post 'purchases/confirmation'       => 'purchases#confirmation'
  post 'orders/add'                   => 'orders#add'
  post 'orders/add_one_product'       => 'orders#add_one_product'
  post 'orders/subtract_one_product'  => 'orders#subtract_one_product'
  post 'orders/remove_product'        => 'orders#remove_product'
  post 'orders/check_order_quantities'=> 'orders#check_order_quantities'
  post 'orders/mark_as_shipped'       => 'orders#mark_as_shipped'
  # post 'sessions/sign_out'          => 'sessions#destroy'
  delete 'sessions'                   => 'sessions#destroy' 
  post 'products/:id'                 => 'products#retire', as: :retired
  post 'products/retire/:id'          => 'products#unretire', as: :unretired
  get 'profile'                       => 'users#show'

  root 'welcome#index'
  get "/faq"                          => 'static_pages#faq'
  get "/about_us"                     => 'static_pages#about_us'
  get "/return_policy"                => 'static_pages#return_policy'
  get '/stats'                        => 'users#stats'

  

  


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
