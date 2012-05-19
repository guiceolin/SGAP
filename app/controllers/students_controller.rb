class StudentsController < ApplicationController
  respond_to :json
  def index
    @students = Student.search(params[:term])
     respond_with @students
  end
end
