Rails.application.routes.draw do
  namespace :api do
    resources :ingredients, only: [:index]
  end
end
