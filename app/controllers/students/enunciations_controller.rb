class Students::EnunciationsController < ApplicationController
  respond_to :html

  def show
    @enunciation = current_user.crowds.find_by_name(params[:crowd_id]).enunciations.find_by_name(params[:id])
    @solution = current_user.groups.where(:enunciation_id => @enunciation.id).first.solution
    respond_with :students, @enunciation.crowd, @enunciation
  end
end
