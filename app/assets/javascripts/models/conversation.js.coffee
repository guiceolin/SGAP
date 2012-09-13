class Sgap.Conversation extends Batman.Model
  @storageKey: 'conversations'
  @resourceName: 'conversation'
  @hasMany 'messages'
  @persist Batman.RailsStorage

  @encode 'last_read'

