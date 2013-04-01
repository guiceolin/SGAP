class Event

  attr_accessor :id, :summary, :start_date, :end_date, :user, :calendar_id, :client
  def initialize(attr = {})
    self.calendar_id = attr[:calendar_id]
    self.id = attr[:id]
    self.summary = attr[:summary]
    self.start_date = attr[:start_date]
    self.end_date = attr[:end_date]
    self.client = Client.new(attr[:user])
  end

  def save
    unless id.present?
      self.id = self.class.create(calendar_id, @client, start_date, end_date, summary )
      true
    else
      self.class.update(calendar_id, id, @client, start_date, end_date, summary)
    end
  end

  def self.update(calendar_id, id, client, start_date = nil, end_date = nil, summary = nil)
    body = {}
    body['summary'] = summary if summary.present?
    body['start'] =  { 'date' => start_date } if start_date.present?
    body['end'] = { 'date' => end_date } if end_date.present?
    result = client.execute(
      api_method: service(client).events.patch,
      parameters: { 'calendarId' => calendar_id, 'eventId' => id },
      body_object: body,
      headers: {'Content-Type' => 'application/json'}
    )
    true
  end

  def self.create(id, client, start_date = nil, end_date = nil , summary = nil)
    result = client.execute(
      api_method: service(client).events.insert,
      parameters: { 'calendarId' => id },
      body_object: {
        'summary' => summary,
        'start' => {
          'date' => start_date
        },
        'end' => {
          'date' => end_date
        },
      },
      :headers => {'Content-Type' => 'application/json'}
    )
    JSON.parse(result.body)["id"]
  end


  private
  def self.service(client)
    client.discovered_api('calendar', 'v3')
  end

end
