Rails.application.routes.draw do

  get 'purchases/new'

  # get 'reservations/index'

  # get 'reservations/new'

  # get 'reservations/edit'

  # get 'reservations/show'

  # get 'reservations/update'

  # get 'reservations/destroy'

  # get 'reservations/create'

  resources :users, controller: 'users', only: Clearance.configuration.user_actions

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  #get "/sign_up" => "clearance/users#new", as: "sign_up"
  root 'home#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'
  get '/search' => 'listings#search' 

  get '/listing/resevations', to: "resevations#index", as: "somehting_nickname"

  post '/reservations/:reservation_id/checkout' => 'transactions#create'

    resources :listings do 
      collection do
        get :autocomplete
      end
      # resources :listing_images, only:[:create, :new]
      resources :reservations
      
    end

resources :transactions, only: [:new, :create]

  # resources :home do
  #   resources :users 


  #   match '/auth/:provider/callback' => 'sessions#create'
  # match '/signout' => 'sessions#destroy'
  # match '/signin' => 'sessions#new'



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
