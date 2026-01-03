Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      # Seller authentication routes
      post 'sellers/login', to: 'sellers#login'
      post 'sellers/register', to: 'sellers#register'
      post 'sellers/logout', to: 'sellers#logout'
      get 'sellers/me', to: 'sellers#me'
      
      # Seller CRUD routes
      resources :sellers, only: [:index, :show, :update, :destroy]
    end
  end
end
