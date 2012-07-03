class Admin::StudentsController < ApplicationController
  respond_to :json, :html
  def index
    @students = Student.search(params[:term])
     respond_with @students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    @student.save
    respond_with @student
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    @student.update_attributes(params[:student])
    @student.save
    respond_with @student
  end
end
