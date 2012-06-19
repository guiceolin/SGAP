class StudentsController < ApplicationController
  respond_to :json
  def index
    @students = Student.search(params[:term])
    respond_with @students
  end

  def show
    @student = Student.find_by_id(params[:id])
    respond_with(@student)
  end
end
