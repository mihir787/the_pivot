Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  match '/404', to: 'errors#file_not_found', via: :all
  root to: "stores#index"

  namespace :admin do
    resources :photos, except: [:destroy]
  end

  namespace :user do
    resources :orders, only: [:index, :show]
    resources :downloads, only: :index
  end

  get "/login/twitter", to: "sessions#twitter"

  get '/auth/:provider/callback' => 'sessions#create'
  resources :charges

  resource :checkout, only: [:create, :update]

  resources :orders, only: [:create]

  get "orders/payment", to: "orders#payment"
  get "admin/orders/dashboard", to: "admin/orders#dashboard"
  get "admin/order", to: "admin/orders#show"
  post "admin/order/update", to: "admin/orders#update"
  get "checkout/confirmation", to: "checkouts#confirmation"
  post "checkout/increase", to: "checkouts#increase"
  post "checkout/decrease", to: "checkouts#decrease"
  post "checkout/remove", to: "checkouts#remove"
  get "checkout", to: "checkouts#show"
  get 'checkout', to: "checkouts#edit"
  resources :photos, only: [:show, :index]
  resource :user, except: [:update]
  patch "/user", to: "users#update", as: :update_user
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  get "admin/dashboard", to: "admin/dashboard#show"
  get "/home", to: "home#index"
  get ":store/admin/dashboard", to: "stores/admin#show", as: "store_admin_dashboard"

  get ":id/edit", to: "stores#edit", as: :edit_store
  put ":id", to: "stores#update", as: :store

  namespace :stores, path: ':store', as: :store do
    resources :photos,  only: [:index, :show]
    resources :orders, only: [:index, :show]
    resources :admin, except: [:show]
    namespace :admin do 
      resources :photos
      resources :orders, only: [:index, :show, :update]
    end
  end
end
