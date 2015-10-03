Rails.application.routes.draw do

  root 'projects#index'

  resources :projects, only: [:index, :new, :show, :create]
    resources :pledges
    resources :rewards
    resources :comments
  # end

  resources :categories, only: [:index, :show]

  resources :users, except: [:destroy]

  resources :user_sessions, only: [:new, :create, :destroy]

  post '/users/:id(.:format)' => 'users#update'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # gem 'tags/:tag', to: 'projects#index', as: :tag

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'users/update'

  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'

  # get 'users/destroy'

    resources :projects do
    resources :breakpoints, on: :collection
    resources :comments
  end

  resources :pledges, except: [:index]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'tagged' => 'projects#tagged', :as => 'tagged'

  # get 'project/new'

  # get 'project/create'

  # get 'project/update'

  # get 'project/destroy'

  # get 'project/show'

  # get 'project/index'

  # get 'project/edit'

  # get 'pledges/index'

  # get 'pledges/create'

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
