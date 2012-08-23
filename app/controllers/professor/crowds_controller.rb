class Professor::CrowdsController < ApplicationController

  respond_to :html, :json

  def search
    @crowds = current_user.crowds.search(params[:terms].present? ? params[:terms] : params[:term])
    respond_with :professor, @crowds, layout: !request.xhr?
  end
  def index
    @crowds = current_user.crowds.all
    respond_with :professor, @crowds
  end
  def show
    @crowd = current_user.crowds.find_by_name(params[:id])
    respond_with :professor, @crowd
  end
end
