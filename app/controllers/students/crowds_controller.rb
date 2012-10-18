class Students::CrowdsController < ApplicationController
  respond_to :html

  def index
    @crowds = current_user.crowds
    respond_with :students, @crowds
  end
  def show
    @crowd = current_user.crowds.find_by_name(params[:id])
    respond_with :students, @crowd
  end
end
