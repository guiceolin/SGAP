class Calendar

  attr_accessor :id, :summary
  def initialize(attr = {})
    @client = ::Client.new(attr[:user])
    self.id = attr[:id]
    self.summary = attr[:summary]
  end

  def save
    unless id.present?
      self.id = self.class.create(@client, self.summary)
      true
    end
  end

  def self.create(client, summary)
    summary ||= "TRABALHO"
    service = client.discovered_api('calendar', 'v3')
    result = client.execute(
      api_method:  service.calendars.insert,
      parameters:  {},
      body_object: { summary: summary })
    JSON.parse(result.body)["id"]
  end

end
