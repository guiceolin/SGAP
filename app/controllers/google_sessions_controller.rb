class GoogleSessionsController < ApplicationController
  def create
    #exampleoauth callback
    @auth = request.env["omniauth.auth"]
    @token = @auth["credentials"]["token"]
  end
end
