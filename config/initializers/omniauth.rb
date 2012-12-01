OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '525802749269.apps.googleusercontent.com', '40cwHuiNY2Io8jfI2G307MEa', :scope => 'userinfo.email,userinfo.profile,calendar'
end
