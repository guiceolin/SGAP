class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      login user
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    redirect_to new_session_path
  end
end
