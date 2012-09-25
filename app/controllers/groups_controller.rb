class GroupsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.groups
  end

  def show
    respond_with current_user.groups.find(params[:id])
  end
end
