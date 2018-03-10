Rails.application.routes.draw do
  get 'dashboard/show'

  devise_for :users
  root to: "dashboard#show"
end
