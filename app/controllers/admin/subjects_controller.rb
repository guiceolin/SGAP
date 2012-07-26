class Admin::SubjectsController < ApplicationController
  respond_to :html

  def index
    @subjects = Subject.all
    respond_with :admin, @subjects
  end

  def search
    @subjects = Subject.search(params[:terms])
    respond_with :admin, @subjects, layout: !request.xhr?
  end

  def new
    @subject = Subject.new
    respond_with :admin, @subject
  end

  def create
    @subject = Subject.new(params[:subject])
    @subject.save
    respond_with :admin, @subject
  end

  def show
    @subject = Subject.find_by_id(params[:id])
    respond_with :admin, @subject
  end

  def edit
    @subject = Subject.find_by_id(params[:id])
    respond_with :admin, @subject
  end

  def update
    @subject = Subject.find_by_id(params[:id])
    @subject.update_attributes(params[:subject])
    @subject.save
    respond_with :admin, @subject
  end

end
