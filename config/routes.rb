Rails.application.routes.draw do

  root 'welcome#index'
  get 'company' => 'welcome#company'
  get 'services' => 'welcome#managed_services'

  get 'newsroom' => 'newsroom#index' #renamed to Blog
  resources :articles

  get 'team' => 'team#index'

  resources :correspondences, except: [:index, :show, :edit, :update]

  resources :feedbacks, except: [:edit, :update]

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => {:sessions => "sessions"}
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :user, :controller => "user"
  
  get 'staff/' => 'staff#index'

  get 'reports/feedback' => 'reports#feedback'

  #footer extras
  get 'email-disclaimer' => 'disclaimer#index'
  get 'website-disclaimer' => 'disclaimer#web'





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
