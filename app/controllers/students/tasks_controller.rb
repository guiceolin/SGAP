class Students::TasksController < ApplicationController
  def create
    @task = Task.new(params[:task])
    @enunciation = current_user.crowds.find_by_name(params[:crowd_id]).enunciations.find_by_name(params[:enunciation_id])
    @task.solution = current_user.groups.where(:enunciation_id => @enunciation.id).first.solution
    @task.save
    redirect_to students_crowd_enunciation_path(@enunciation.crowd, @enunciation)
  end

  def edit
    @task = Task.find(params[:id])
    @enunciation = current_user.crowds.find_by_name(params[:crowd_id]).enunciations.find_by_name(params[:enunciation_id])
    @task.solution = current_user.groups.where(:enunciation_id => @enunciation.id).first.solution
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    @task.save
    redirect_to students_crowd_enunciation_path(@task.solution.group.enunciation.crowd, @task.solution.group.enunciation)
  end
end
