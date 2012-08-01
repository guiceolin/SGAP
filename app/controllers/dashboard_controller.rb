class DashboardController < ApplicationController

  def index
    render params[:dashboard].to_s
  end
end
