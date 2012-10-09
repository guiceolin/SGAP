class GroupsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.groups.active
  end

  def show
    respond_with current_user.groups.find(params[:id])
  end
end
