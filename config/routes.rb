SGAP::Application.routes.draw do
  match "/auth/:provider/callback" => "google_sessions#create"
  match '/student/' => redirect("/students/crowds/")
  match '/professor/' => redirect("/professor/subjects/")
  resource :session, only: [:new,:create,:destroy]
  resources :users
  resources :conversations
  resources :crowds, :groups, :subjects, only: [:index, :show]
  resources :messages, only: [:create, :index]
  resources :conversation_approvations, only: [:index,:update,:destroy]
  namespace :professor do

    resources :clone_enunciations, only: [:show]
    resources :students do
      collection do
        get :search
      end
    end
    resources :subjects do
      resources :crowds do
        resources :enunciations do
          resources :attachments, to: "enunciation_attachments"
          resources :groups do
            resources :memberships, only: [:create, :show, :destroy]
          end
        end
        collection do
          get :search
        end
      end
      collection do
        get :search
      end
    end

  end
  namespace :students do
    resources :crowds, only: [:show, :index] do
      resources :enunciations, only: [:show] do
        resource :solution do
          resources :tasks
          resources :start_tasks, only: :update
          resources :complete_tasks, only: :update
        end
      end
    end
  end
  namespace :admin do
    resources :crowds, only: [:index]
    resources :imports, only: [:new, :create]
    resources :enrollments, only: :create
    resources :students, :professors do
      collection do
        get :search
      end
    end
    resources :subjects do
      collection do
        get :search
      end
      resources :crowds do
        collection do
          get :search
        end
        resources :enrollments
      end
    end
  end

  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'


  get ':dashboard', to: 'dashboard#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'sessions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
