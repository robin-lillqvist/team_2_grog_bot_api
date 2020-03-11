Rails.application.routes.draw do
  namespace :api do
    resources: only: [:index]
end
