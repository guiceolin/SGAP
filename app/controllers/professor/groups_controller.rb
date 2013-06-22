class Professor::GroupsController < ApplicationController
  respond_to :html, :json

  def index
    @groups = current_enunciation.groups
    respond_with :professor, @groups
  end
  def show
    @group = current_enunciation.groups.find_by_name(params[:id])
    respond_with :professor, @group
  end
  def new
    @group = current_enunciation.groups.build
    respond_with :professor, @group
  end

  def create
    @group = Group.create(params[:group])
    @group.enunciation = current_enunciation
    binding.pry
    @group.save
    respond_with :professor, current_subject, current_crowd, current_enunciation, @group
  end

  def edit
    @group = current_enunciation.groups.find_by_name(params[:id])
    respond_with :professor, @group
  end
  def update
    @group = current_enunciation.groups.find_by_name(params[:id])
    @group.update_attributes(params[:group])
    @group.save
    respond_with :professor, current_subject, current_crowd, current_enunciation, @group
  end
  def destroy
    @group = current_enunciation.groups.find_by_name(params[:id])
    @group.destroy
    respond_with :professor, current_subject, current_crowd, current_enunciation, @group
  end

  private

  def current_subject
    @current_subject ||= current_user.subjects.find_by_code(params[:subject_id])
  end

  def current_crowd
    @current_crowd ||= current_subject.crowds.find_by_name(params[:crowd_id])
  end

  def current_enunciation
    @current_enunciation ||= current_crowd.enunciations.find_by_name(params[:enunciation_id])
  end
end
