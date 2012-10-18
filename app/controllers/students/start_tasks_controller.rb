class Students::StartTasksController < ApplicationController

  def update
    @enunciation = current_user.crowds.find_by_name(params[:crowd_id]).enunciations.find_by_name(params[:enunciation_id])
    @task = current_user.groups.where(:enunciation_id => @enunciation.id).first.solution.tasks.find_by_id(params[:id])
    @task.start
    @task.save
    redirect_to students_crowd_enunciation_path(@enunciation.crowd, @enunciation)
  end
end
