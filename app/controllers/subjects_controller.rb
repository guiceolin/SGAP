class SubjectsController < ApplicationController
  respond_to :html

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      respond_with @subject
    else
      render :new
    end
  end

  def show
    @subject = Subject.find_by_id(params[:id])
    respond_with @subject
  end

  def edit
    @subject = Subject.find_by_id(params[:id])
    respond_with @subject
  end

  def update
    @subject = Subject.find_by_id(params[:id])
    @subject.update_attributes(params[:subject])
    if @subject.save
      respond_with @subject
    else
      render :edit
    end
  end

end
