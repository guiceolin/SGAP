class Event

  def self.list(id,token)
    client, service = self.connect(token)
    result = client.execute(
      :api_method => service.events.list,
      :parameters => {'calendarId' => id },
      :headers => {'Content-Type' => 'application/json'}
    )
    result.data.items
  end

  def self.create(id, token, sumary="")
    client, service = self.connect(token)
    result = client.execute(
      api_method: service.events.insert,
      parameters: { 'calendarId' => id },
      body_object: {
        'summary' => sumary,
        'start' => {
          'date' => '2013-02-23'
        },
        'end' => {
          'date' => '2013-02-23'
        },
      },
      :headers => {'Content-Type' => 'application/json'}
    )
  end


  private
  def self.connect(token)
    client = Google::APIClient.new
    client.authorization.access_token = token
    service = client.discovered_api('calendar', 'v3')
    [client, service]
  end

end
