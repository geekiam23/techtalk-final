class DashboardController < ApplicationController
  def show
    @post = Post.new
    @posts = current_user.posts
  end
end
