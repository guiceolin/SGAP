class SessionsController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]
  before_filter :require_no_login, except: :destroy

  layout 'session'

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      login user
      redirect_to "/#{user.type.downcase}/"
    else
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    redirect_to new_session_path
  end
end
