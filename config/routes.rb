Rails.application.routes.draw do
  devise_for :users
  get 'managements/index'
  root to: "managements#index"
end
