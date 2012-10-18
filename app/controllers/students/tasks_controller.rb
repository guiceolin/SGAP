class Students::TasksController < ApplicationController
  def create
    @task = Task.new(params[:task])
    @enunciation = current_user.crowds.find_by_name(params[:crowd_id]).enunciations.find_by_name(params[:enunciation_id])
    @task.solution = current_user.groups.where(:enunciation_id => @enunciation.id).first.solution
    @task.save
    redirect_to students_crowd_enunciation_path(@enunciation.crowd, @enunciation)
  end
end
