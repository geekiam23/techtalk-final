Rails.application.routes.draw do
  get 'posts/create'

  get 'dashboard/show'

  devise_for :users
  root to: "dashboard#show"
  resources :posts, only: [:show, :index]
end
