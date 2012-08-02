class Admin::CrowdsController < ApplicationController

  respond_to :html, :json

  def search
    @crowds = Crowd.search(params[:terms].present? ? params[:terms] : params[:term])
    respond_with :admin, @crowds, layout: !request.xhr?
  end

  def index
    @crowds = Crowd.all
    respond_with :admin, @crowds
  end
  def new
    @crowd = Crowd.new
    respond_with :admin, @crawd
  end

  def create
    @crowd = Crowd.new(params[:crowd])
    @crowd.save
    respond_with :admin, @crowd
  end

  def edit
    @crowd = Crowd.find_by_name(params[:id])
    respond_with :admi, @crowd
  end

  def update
    @crowd = Crowd.find_by_name(params[:id])
    @crowd.update_attributes(params[:crowd])
    @crowd.save
    respond_with :admin, @crowd
  end

  def show
    @crowd = Crowd.find_by_name(params[:id])
    respond_with :admin, @crowd
  end

  def destroy
    @crowd = Crowd.find_by_name(params[:id])
    @crowd.destroy
    respond_with :admin, @crowd
  end
end
