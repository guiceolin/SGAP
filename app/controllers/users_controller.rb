class UsersController < ApplicationController
  before_filter :require_no_login, only: [:new, :create]
  skip_before_filter :require_login, only: [:new, :create]

  respond_to :html
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
end
