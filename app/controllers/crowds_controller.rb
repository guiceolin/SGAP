class CrowdsController < ApplicationController
  respond_to :json
  def index
    respond_with current_user.crowds
  end
  def show
    respond_with current_user.crowds.find(params[:id])
  end
end
