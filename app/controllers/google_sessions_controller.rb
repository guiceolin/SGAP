class GoogleSessionsController < ApplicationController
  def create
    #exampleoauth callback
    auth = request.env["omniauth.auth"]
    token = auth["credentials"]["token"]
    current_user.oauth_access_token = auth["credentials"]["token"]
    current_user.oauth_refresh_token = auth["credentials"]["refresh_token"]
    current_user.oauth_expires_at = auth["credentials"]["expires_in"]
    calendar = ::Calendar.new(user: current_user, summary: "SGPA", id: current_user.google_calendar_id)
    current_user.google_calendar_id = calendar.save
    current_user.save
    redirect_to edit_user_path(current_user)
  end
end
