OmniAuth.config.full_host = "http://localhost:3000"

credentials = YAML.load(File.open(Rails.root + "config/google_credentials.yml"))

::G_AUTH = credentials['key']
::G_PASS =credentials['password']
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, G_AUTH, G_PASS, :scope => 'userinfo.email,userinfo.profile,calendar'
end
