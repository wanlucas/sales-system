Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      namespace :sellers do
        post 'login', to: 'auth#login'
        post 'register', to: 'auth#register'
        post 'logout', to: 'auth#logout'
        get 'me', to: 'auth#me'
        
        resources :products
      end
    end
  end
end
