Rails.application.routes.draw do
  root to: "scores#index"
  devise_for :users
end
