class UsersController < ApplicationController
  before_filter :require_no_login, only: [:new, :create]
  skip_before_filter :require_login, only: [:new, :create]

  respond_to :html, :json

  def index
    @user = User.where('username like ?', "%#{params[:term]}%")
    respond_with @user, root: false
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      respond_with @user
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end
end
