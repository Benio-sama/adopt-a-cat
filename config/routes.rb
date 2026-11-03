Rails.application.routes.draw do
  get "pages/home"
  get "pages/about_us"
  root "pages#home"
  get "/home", to: "pages#home"
  get "/about_us", to: "pages#about_us"

  get "/adopt", to: "cats#index"
  get "/adopt/:id", to: "cats#show", as: "cat_details"
  post "/adopt/:id/reserve", to: "cats#reserve", as: "reserve_cat"

  get "users/new", to: "users#new"
  post "users/create", to: "users#create"
  get "users/edit", to: "users#edit"
  put "users/update", to: "users#update"
  get "users/forgotten", to: "users#forgotten"
  post "/session/create", to: "pages#home"
  get "/sessions/destroy", to: "pages#home"
  resources :cats
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
