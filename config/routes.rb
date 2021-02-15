Rails.application.routes.draw do
  root to: 'scores#top'

  devise_for :users

  resources :tasks, only: %i[index create edit update destroy] do
    collection do
      get 'my_tasks'
    end
  end

  resources :scores do
    collection do
      get 'top'
      get 'my_scores'
      get 'show_transition'
    end
    member do
      get 'search'
    end
  end
end
