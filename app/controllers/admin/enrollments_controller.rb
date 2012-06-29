class Admin::EnrollmentsController < ApplicationController
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
end
