Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit]
  root to: "links#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :links, only: [:create, :index, :edit, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [:index, :update]
    end
  end
end
