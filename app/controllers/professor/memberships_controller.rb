class Professor::MembershipsController < ApplicationController
  respond_to :json
  def create
    @membership = Membership.new
    @membership.student = Student.find_by_id(params[:membership][:student_id])
    @membership.group = Group.find_by_id(params[:membership][:group_id])
    if @membership.save
      head :created, :location => professor_crowd_group_membership_path(@membership.group.crowd, @membership.group, @membership)
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @membership = Membership.find_by_id(params[:id])
    @membership.destroy
    redirect_to professor_crowd_group_path(@membership.group.crowd, @membership.group)
  end
end
