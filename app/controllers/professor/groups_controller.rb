class Professor::GroupsController < ApplicationController
  respond_to :html, :json

  def index
    @groups = Crowd.find_by_name(params[:crowd_id]).groups
    respond_with :professor, @groups
  end
  def show
    @group = current_user.crowds.find_by_name(params[:crowd_id]).groups.find_by_name(params[:id])
    respond_with :professor, @group
  end
  def new
    @crowd = Crowd.find_by_name(params[:crowd_id])
    @group = Group.new
    respond_with :professor, @group
  end

  def create
    @group = Group.create(params[:group])
    @group.crowd = Crowd.find_by_name(params[:crowd_id])
    @group.save
    respond_with :professor, @group.crowd, @group
  end
  def edit
    @group = current_user.crowds.find_by_name(params[:crowd_id]).groups.find_by_name(params[:id])
    respond_with :professor, @group
  end
  def update
    @group = current_user.crowds.find_by_name(params[:crowd_id]).groups.find_by_name(params[:id])
    @group.update_attributes(params[:group])
    @group.save
    respond_with :professor, @group.crowd, @group
  end
  def destroy
    @group = current_user.crowds.find_by_name(params[:crowd_id]).groups.find_by_name(params[:id])
    @group.destroy
    respond_with :professor, @group.crowd, @group
  end
end
