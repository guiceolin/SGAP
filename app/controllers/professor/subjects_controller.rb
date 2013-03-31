class Professor::SubjectsController < ApplicationController
  respond_to :html, :json

  def index
    @subjects = current_user.subjects
    respond_with :admin, @subjects
  end
  def search
    @subjects = current_user.subjects.search(params[:terms].present? ? params[:terms] : params[:term])
    respond_with :admin, @subjects, layout: !request.xhr?
  end
  def show
    @subject = current_user.subjects.find_by_code(params[:id])
    @crowds = @subject.crowds
    respond_with :admin, @subject
  end
end
