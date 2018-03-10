Rails.application.routes.draw do
  get 'posts/create'

  get 'dashboard/show'

  devise_for :users
  root to: "dashboard#show"
  resources :posts, only: [:show, :index]

  post "text_posts" => "posts#create", defaults: { content_type: TextPost}
end
