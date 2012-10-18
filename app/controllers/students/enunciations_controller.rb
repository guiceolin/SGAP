class Students::EnunciationsController < ApplicationController
  respond_to :html

  def show
    @enunciation = current_user.crowds.find_by_name(params[:crowd_id]).enunciations.find_by_name(params[:id])
    respond_with :students, @enunciation.crowd, @enunciation
  end

end
