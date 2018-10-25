require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books, only: :show do
    resources :sales, only: [:new, :create]
  end

  get "/sales", to: "sales#index"

  namespace :admin do
    mount Sidekiq::Web => "/sidekiq"
    get "styleguide", to: "styleguide#index"
    resources :books, only: :index
  end
end
