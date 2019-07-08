Rails.application.routes.draw do
  root to:'books#main'
  resources :books, except: [:new]
end
