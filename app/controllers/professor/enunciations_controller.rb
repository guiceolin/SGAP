class Professor::EnunciationsController < ApplicationController

  respond_to :html
  def new
    @crowd = current_crowd
    @enunciation = @crowd.enunciations.build
    respond_with @enunciation
  end

  def create
    @enunciation = current_crowd.enunciations.create(params[:enunciation])
    if @enunciation.save
      respond_with :professor, @enunciation.crowd.subject, @enunciation.crowd
    else
      render :new
    end
  end

  def index
    @enunciations = current_user.enunciations.all
  end

  def show
    @enunciation = current_crowd.enunciations.find_by_name(params[:id])
    respond_with @enunciation
  end

  def edit
    @enunciation = current_crowd.enunciations.find_by_name(params[:id])
    respond_with @enunciation
  end

  def update
    @enunciation = current_crowd.enunciations.find_by_name(params[:id])
    @enunciation.update_attributes(params[:enunciation])

    if @enunciation.save
      respond_with :professor, @enunciation
    else
      render :edit
    end
  end

  def destroy
    @enunciation = current_crowd.enunciation.find_by_name(params[:id])
    @enunciation.destroy
    respond_with :professor, @enunciation
  end

  private

  def current_crowd
    @current_crowd ||= current_user.subjects.find_by_code(params[:subject_id]).crowds.find_by_name(params[:crowd_id])
  end
end
