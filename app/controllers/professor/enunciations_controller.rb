class Professor::EnunciationsController < ApplicationController

  respond_to :html
  def new
    @enunciation = current_user.enunciations.build
    respond_with @enunciation
  end

  def create
    crowd = Crowd.find_by_id(params[:enunciation].delete(:crowd_id))
    @enunciation = crowd.enunciations.create(params[:enunciation])
    if @enunciation.save
      respond_with :professor, @enunciation
    else
      render :new
    end
  end

  def index
    @enunciations = current_user.enunciations.all
  end

  def show
    @enunciation =current_user.enunciations.find_by_name(params[:id])
    respond_with @enunciation
  end

  def edit
    @enunciation = current_user.enunciations.find_by_name(params[:id])
    respond_with @enunciation
  end

  def update
    @enunciation = current_user.enunciations.find_by_name(params[:id])
    @enunciation.crowd = Crowd.find_by_id(params[:enunciation].delete(:crowd_id))
    @enunciation.update_attributes(params[:enunciation])

    if @enunciation.save
      respond_with :professor, @enunciation
    else
      render :edit
    end
  end

  def destroy
    @enunciation = Enunciation.find_by_name(params[:id])
    @enunciation.destroy
    respond_with :professor, @enunciation
  end
end
