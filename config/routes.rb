Rails.application.routes.draw do
  devise_for :admin_users, path: "admin", skip: [ :registrations ]

  root "pages#home"

  get "products", to: "products#index"
  get "products/:id", to: "products#show", as: :product
  get "pricing", to: "pricing#index"
  get "portfolio", to: "portfolio_projects#index"
  get "portfolio/:id", to: "portfolio_projects#show", as: :portfolio_project
  get "about", to: "pages#about"
  get "contact", to: "contact_requests#new"
  get "faq", to: "faqs#index"

  resources :contact_requests, only: [ :create ]
  resources :quote_requests, only: [ :new, :create ]

  namespace :admin do
    root "products#index"
    resources :products
    resources :portfolio_projects
    resources :faqs
    resources :contact_requests, only: [ :index, :show, :update ]
    resources :quote_requests, only: [ :index, :show, :update ]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
