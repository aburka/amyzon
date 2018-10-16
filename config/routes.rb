Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books, only: :show do
    resources :sales, only: [:new, :create]
  end

  get "/sales", to: "sales#index"

  get "styleguide", to: "styleguide#index"
end
