Test2::Application.routes.draw do
  namespace :api do
    resources :messages
  end

  resources :messages
  devise_for :users
  root to: "home#index"
end
