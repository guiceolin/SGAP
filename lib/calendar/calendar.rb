class Calendar

  attr_reader :id
  def initialize(id = nil, token = nil)
    @id = id
    @token = token
  end

  def events
    @events ||= ::Event.list(@id, @token)
  end

  def events!
    @events = ::Event.list(@id, @token)
  end

  def add_event(sumary=nil)
    ::Event.create(@id, @token, sumary)
  end

  def self.create(token)
    client = Google::APIClient.new
    client.authorization.access_token = token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendars.insert,
      :parameters => {},
      body_object: { summary: 'RAILS' },
      :headers => {'Content-Type' => 'application/json'})
    binding.pry
    JSON.parse(@result.body)["id"]
  end

end
