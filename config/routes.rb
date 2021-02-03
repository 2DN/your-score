Rails.application.routes.draw do
  root to: "scores#index"
  
  devise_for :users
  
  resources :tasks
  
  resources :subjects
  
  resources :averages
  
  resources :scores
end
