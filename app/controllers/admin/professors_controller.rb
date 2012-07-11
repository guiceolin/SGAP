class Admin::ProfessorsController < ApplicationController

  respond_to :html

  def index
    @professors = Professor.all
    respond_with :admin, @professors
  end

  def new
    @professor = Professor.new
    respond_with :admin, @professor
  end

  def create
    @professor = Professor.new(params[:professor])
    if @professor.save
      respond_with :admin, @professor
    else
      render :new
    end
  end

  def edit
    @professor = Professor.find_by_id(params[:id])
    respond_with :admin, @professor
  end

  def update
    @professor = Professor.find_by_id(params[:id])
    @professor.update_attributes(params[:professor])
    if @professor.save
      respond_with :admin, @professor
    else
      render :edit
    end
  end

  def show
    @professor = Professor.find_by_id(params[:id])
    respond_with :admin, @professor
  end

  def destroy
    @professor = Professor.find_by_id(params[:id])
    @professor.destroy
    respond_with :admin, @professor
  end
end
