class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(username: params[:id])
    @timeline = Timeline.new([@user])
  end

  def search
    @posts = Elasticsearch::Model.search(params[:q], [PicPost, TextPost])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end