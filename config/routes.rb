Rails.application.routes.draw do
  root "search_queries#index"
  resources :search_queries, only: [:index, :create]
end
