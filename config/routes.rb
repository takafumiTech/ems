Rails.application.routes.draw do
  get 'managements/index'
  root to: "managements#index"
end
