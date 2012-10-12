class Professor::MembershipsController < ApplicationController
  respond_to :json
  def create
    @membership = Membership.new
    @membership.student = Student.find_by_id(params[:resource][:student_id])
    @membership.group = Group.find_by_id(params[:resource][:group_id])
    if @membership.save
      head :created, :location => professor_subject_crowd_enunciation_group_membership_path(@membership.group.enunciation.crowd.subject, @membership.group.enunciation.crowd, @membership.group.enunciation, @membership.group, @membership)
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @membership = Membership.find_by_id(params[:id])
    @membership.destroy
    redirect_to professor_subject_crowd_enunciation_group_path(@membership.group.enunciation.crowd.subject, @membership.group.enunciation.crowd, @membership.group.enunciation, @membership.group)

  end
end
