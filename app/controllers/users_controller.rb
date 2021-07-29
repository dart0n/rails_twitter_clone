class UsersController < ApplicationController
  before_action :set_user, only: %i[show following followers]

  def index
    @users = User.all
  end

  def show
    @tweets = @user.feed.paginate(page: params[:page], per_page: 3)
  end

  def following
    @users = @user.following.paginate(page: params[:page])
    render 'index'
  end

  def followers
    @users = @user.followers.paginate(page: params[:page])
    render 'index'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
