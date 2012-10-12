class Professor::CrowdsController < ApplicationController

  respond_to :html, :json

  def search
    @crowds = current_subject.crowds.search(params[:terms].present? ? params[:terms] : params[:term])
    respond_with :professor, @crowds, layout: !request.xhr?
  end
  def index
    @crowds = current_subject.crowds
    respond_with :professor, @crowds
  end
  def show
    @crowd = current_subject.crowds.find_by_name(params[:id])
    respond_with :professor, current_subject, @crowd
  end
  private

  def current_subject
    @current_subject ||= current_user.subjects.find_by_code(params[:subject_id])
  end
end
