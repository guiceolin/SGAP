class Professor::MembershipsController < ApplicationController
  respond_to :json
  def create
    @membership = Membership.create(params[:membership])
    @membership.student = Student.find_by_id(params[:membership][:student_id])
    @membership.group = Group.find_by_id(params[:group_id])
    if @membership.save
      head :created, :location => professor_membership_path(@membership)
    else
      head :unprocessable_entity
    end
  end
end
