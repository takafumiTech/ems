Rails.application.routes.draw do
  devise_for :users
  root to: "managements#index"
  resources :users, only: [:edit, :update]
  resources :daily_counts, except: [:show, :destroy] do
    collection do
      post :search
    end
  end
  resources :managements, only: [:index, :new, :create, :edit, :update] do
    member do
      get  :purchase
      post :purchase_do
    end
  end
end
