class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new ,:create]
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def create
    @user =User.new(users_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show

  end

  private
  def users_params
    params[:user].permit(:name,:email,:password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
