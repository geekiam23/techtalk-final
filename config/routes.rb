Rails.application.routes.draw do

  # scope '/api' do
  # resources :posts
  # resources :dashboard
  # mount_devise_token_auth_for 'User', at: 'auth'
  # end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :users do
      resources :posts
    end
    # resources :posts
    # resources :users
  end


  get 'followers/index'

  get 'posts/create'

  get 'likes/create'
  get '/posts/show_pic'
  get '/posts/show_text'
  get '/posts/show_project'
  get '/posts/show_job'
  get '/posts/show_meeting'

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

  post "job_posts" => "posts#create", defaults: { content_type: JobPost}

  post "meeting_posts" => "posts#create", defaults: { content_type: MeetingPost}

  post "pic_posts" => "posts#create", defaults: { content_type: PicPost}

  post "project_posts" => "posts#create", defaults: { content_type: ProjectPost}

  post "text_posts" => "posts#create", defaults: { content_type: TextPost}


end
