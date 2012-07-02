class Admin::StudentsController < ApplicationController
  respond_to :json, :html
  def index
    @students = Student.search(params[:term])
     respond_with @students
  end
end
