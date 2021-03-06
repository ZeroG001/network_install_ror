NetworkInstallRor::Application.routes.draw do



  resources :forms do
    get 'search', to: 'forms#search', as: :search
    get 'advsearch', to: 'forms#advsearch', as: :advsearch
  end

  resources :users

  devise_for :users, :path_prefix => 'manage'

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    root "devise/sessions#new"
  end


  post 'signemin' => 'users#sign_em_in'



  # The form in users#index depends on this link
  get 'index' => 'users#index'
  get 'search' => 'forms#search'
  get 'advsearch' => 'forms#advsearch'
  get 'advsearch_form' => 'forms#advsearch_form'
  get 'form_error', to: redirect('/error_page.html')

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
