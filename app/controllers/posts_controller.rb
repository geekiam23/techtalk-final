class PostsController < ApplicationController
  def create
    post = current_user.posts.create(posts_params)
    redirect_to :root, redirect_options_for(post)
  end

  def index
    if params[:tag]
        @posts = Post.tagged_with(params[:tag])
    else
        @posts = Post.all
    end
  end

  def show_text
    @post = TextPost.find(params[:id])
  end

  def show_pic
    @post = PicPost.find(params[:id])
  end

  def show_project
    @post = ProjectPost.find(params[:id])
  end

  def show_job
    @post = JobPost.find(params[:id])
  end

  def show
    # case post._type
    # when "text_post" then
    #   @post = TextPost.find(params[:id])
    # when "pic_post" then
    #   @post = PicPost.find(params[:id])
    # end

    @post = Post.find(params[:id])
  end

  def search
    @posts = Elasticsearch::Model.search(params[:q], [JobPost, PicPost, ProjectPost, TextPost])
  end

  private

  def posts_params
    { content: content_from_params }
  end

  def content_from_params
    params[:content_type].new(content_params)
  end

  def content_params
    params.require(:post).require(:content).permit!
  end


  def redirect_options_for(post)
    if post.persisted?
      { notice: "Post successfully created" }
    else
      { alert: "Sorry, post was not successful!" }
    end
  end
end
