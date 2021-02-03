Rails.application.routes.draw do
  root to: "scores#index"
  
  devise_for :users
  
  resources :tasks
  
  resources :subjects
  
  resources :averages
  
  resources :scores do
    collection do
      get 'my_scores'
    end
  end

end
