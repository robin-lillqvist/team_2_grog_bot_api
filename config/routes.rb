Rails.application.routes.draw do
  namespace :api do
    resources :ingredients, only: [:index]
    resources :cocktails, only: [:index]
  end
end
