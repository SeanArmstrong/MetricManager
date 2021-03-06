Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end

  mount API::Root => '/'

  devise_for :users

  root 'projects#index'

  post 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  post 'tasks/:id/uncomplete', to: 'tasks#uncomplete', as: 'uncomplete_task'
  post 'tasks/:id/hide', to: 'tasks#hide', as: 'hide_task'
  post 'tasks/:id/display', to: 'tasks#display', as: 'display_task'

  post 'klasses/:id/hidetasks', to: 'klasses#hidetasks', as: 'hide_tasks_for_klass'
  post 'klasses/:id/displaytasks', to: 'klasses#displaytasks', as: 'display_tasks_for_klass'

  post 'methods/:id/hidetasks', to: 'methoods#hidetasks', as: 'hide_tasks_for_methood'
  post 'methods/:id/displaytasks', to: 'methoods#displaytasks', as: 'display_tasks_for_methood'

  post 'projects/:id/hidetasks', to: 'projects#hidetasks', as: 'hide_tasks_for_project'
  post 'projects/:id/displaytasks', to: 'projects#displaytasks', as: 'display_tasks_for_project'

  get 'projects/:pid/classes', to: 'klasses#index', as: 'klasses'
  get 'projects/:pid/classes/:kid', to: 'klasses#show', as: 'klass'
  get 'projects/:pid/classes/:kid/methods', to:'methoods#index', as: 'methods'
  get 'projects/:pid/classes/:kid/methods/:mid', to: 'methoods#show', as: 'method'
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
