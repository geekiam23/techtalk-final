Rails.application.routes.draw do
  get 'posts/create'

  get 'likes/create'

  get 'dashboard/show'

  devise_for :users
  root to: "dashboard#show"

  resources :posts, only: [:show, :index] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  post "text_posts" => "posts#create", defaults: { content_type: TextPost}

  post "pic_posts" => "posts#create", defaults: { content_type: PicPost}
end
