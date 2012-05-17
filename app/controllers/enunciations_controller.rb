class EnunciationsController < ApplicationController

  respond_to :html
  def new
    @enunciation = current_user.enunciations.build
    respond_with @enunciation
  end

  def create
    @enunciation = current_user.enunciations.create(params[:enunciation])
    if @enunciation.save
      respond_with @enunciation
    else
      render :new
    end
  end

  def index
    @enunciations = current_user.enunciations.all
  end

  def show
    @enunciation =current_user.enunciations.find_by_id(params[:id])
    respond_with @enunciation
  end

  def edit
    @enunciation = current_user.enunciations.find_by_id(params[:id])
    respond_with @enunciation
  end

  def update
    @enunciation = current_user.enunciations.find_by_id(params[:id])
    @enunciation.update_attributes(params[:enunciation])
    if @enunciation.save
      respond_with @enunciation
    else
      render :edit
    end
  end
end
