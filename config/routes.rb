Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :weeks, only: [:index, :create, :update, :destroy] do
        resources :goals, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
