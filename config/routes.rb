Rails.application.routes.draw do
  root "pages#home"
  get "/home", to: "pages#home", as: "hello"
  get "/about_us", to: "pages#about_us"

  get "/adopt", to: "cats#index"
  get "/adopt/:id", to: "cats#show", as: "cat_details"
  post "/adopt/:id/adopt", to: "cats#adopt", as: "adopt_cat"

  get  "users/new", to: "users#new", as: "registration"
  post "users/create", to: "users#create", as: "register"
  get  "users/forgotten", to: "users#forgotten", as: "forgotten"
  post "users/recover", to: "users#recover", as: "recover"
  get  "users/edit", to: "users#edit", as: "profile"
  put  "users/update", to: "users#update", as: "update_profile"
  
  get  "sessions/new", to: "sessions#new", as: "login_page"
  post "sessions/create", to: "sessions#create", as: "login"
  get  "sessions/destroy", to: "sessions#destroy", as: "logout"

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
