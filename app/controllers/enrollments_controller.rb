class EnrollmentsController < ApplicationController
  respond_to :json
  def create
    @enrollment = Enrollment.new(params[:enrollment])
    if @enrollment.save
      head :created, :location => crowd_enrollment_path(@enrollment.crowd,@enrollment)
    else
      head :unprocessable_entity
    end
  end
  def show
    @enrollment = Enrollment.find_by_id(params[:id])
    respond_with(@enrollment)
  end

  def destroy
    @enrollment = Enrollment.find_by_id(params[:id])
    @enrollment.destroy
    respond_with(@enrollment)
  end

  def index
    respond_with(@enrollments = Enrollment.find_all_by_crowd_id(params[:crowd_id]))
  end
end
