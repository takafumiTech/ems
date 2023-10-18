Rails.application.routes.draw do
  devise_for :users
  root to: "managements#index"
  resources :users, only: [:edit, :update]
end
