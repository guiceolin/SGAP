class Admin::StudentsController < ApplicationController
  respond_to :json, :html
  def index
    @students = Student.search(params[:term])
    respond_with :admin, @students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    @student.save
    respond_with :admin, @student
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    @student.update_attributes(params[:student])
    @student.save
    respond_with :admin, @student
  end

  def show
    respond_with(@student = Student.find_by_id(params[:id]))
  end
end
