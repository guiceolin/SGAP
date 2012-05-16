class CrowdsController < ApplicationController

  respond_to :html
  def index
    @crowds = Crowd.all
    respond_with @crowds
  end
  def new
    @crowd = Crowd.new
    respond_with @crawd
  end

  def create
    @crowd = Crowd.new(params[:crowd])
    if @crowd.save
      respond_with @crowd
    else
      render :new
    end
  end

  def edit
    @crowd = Crowd.find_by_id(params[:id])
    respond_with @crowd
  end

  def update
    @crowd = Crowd.find_by_id(params[:id])
    @crowd.update_attributes(params[:crowd])
    if @crowd.save
      respond_with @crowd
    else
      render :edit
    end
  end

  def show
    @crowd = Crowd.find_by_id(params[:id])
    respond_with @crowd
  end
end
