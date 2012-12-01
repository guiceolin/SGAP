class GoogleSessionsController < ApplicationController
  def create
    raise request.env["omniauth.auth"].inspect
    raise params.inspect
  end
end

