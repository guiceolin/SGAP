class Client < Google::APIClient
  def initialize(user)
    super()
    self.authorization.client_id = ::G_AUTH
    self.authorization.client_secret = ::G_PASS
    self.authorization.update_token!(refresh_token: user.oauth_refresh_token, expires_in: 0 )
    self.authorization.fetch_access_token! if self.authorization.expired?
    self
  end
end
