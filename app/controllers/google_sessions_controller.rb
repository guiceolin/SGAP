class GoogleSessionsController < ApplicationController
  def create
    #exampleoauth callback
    auth = request.env["omniauth.auth"]
    token = auth["credentials"]["token"]
    current_user.oauth_access_token = auth["credentials"]["token"]
    current_user.oauth_refresh_token = auth["credentials"]["refresh_token"]
    current_user.oauth_expires_at = auth["credentials"]["expires_in"]
    current_user.save
  end
end
