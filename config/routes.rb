Rails.application.routes.draw do
  get 'followers/index'

  get 'posts/create'

  get 'likes/create'
  get '/posts/show_pic'
  get '/posts/show_text'
  get 'search', to: 'posts#search'

  devise_for :users
  root to: "dashboard#show"

  resources :users, only: [:create, :show] do
    resources :followers, only: [:index]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
  end

  resources :posts, only: [:show, :index] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  post "text_posts" => "posts#create", defaults: { content_type: TextPost}

  post "pic_posts" => "posts#create", defaults: { content_type: PicPost}
end
