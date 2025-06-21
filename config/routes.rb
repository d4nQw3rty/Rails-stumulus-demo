Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  resources :home do
    # Define a route for the index action
    get "index", on: :collection
    # Define a route for the send_form action
    post "send_form", on: :collection
  end

  resources :selections do
    collection do
      get "index"
      get "food_options"
      get "fetch_ip_data"
    end
  end

  resources :turbo_demos do
    collection do
      get "index"
      post "content1"
      post "content2"
      post "content3"
      post "increment"
      post "decrement"
      post "text_processor"
      post "select_demo_1"
      post "select_demo_2"
      post "content4"
      post "words_counter"
    end
  end
  # Defines the root path route ("/")
  root "home#index"
end
