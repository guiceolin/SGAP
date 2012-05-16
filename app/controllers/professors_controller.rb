class ProfessorsController < ApplicationController

  respond_to :html

  def index
    @professors = Professor.all
    respond_with @professors
  end

  def new
    @professor = Professor.new
    respond_with @professor
  end

  def create
    @professor = Professor.new(params[:professor])
    if @professor.save
      respond_with @professor
    else
      render :new
    end
  end

  def edit
    @professor = Professor.find_by_id(params[:id])
    respond_with @professor
  end

  def create
    @professor = Professor.find_by_id(params[:id])
    @professor.update_attributes(params[:professor])
    if @professor.save
      respond_with @professor
    else
      render :edit
    end
  end

  def show
    @professor = Professor.find_by_id(params[:id])
    respond_with @professor
  end
end
