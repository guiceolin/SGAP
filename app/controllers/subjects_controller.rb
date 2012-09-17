class SubjectsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.subjects
  end

  def show
    respond_with current_user.subjects.find(params[:id])
  end
end
