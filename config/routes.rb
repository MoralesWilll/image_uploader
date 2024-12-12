# config/routes.rb
Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    resources :images
    root "images#index"
  end

  # The rest of your routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
