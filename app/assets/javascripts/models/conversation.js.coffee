class Sgap.Conversation extends Batman.Model
  @storageKey: 'conversations'
  @resourceName: 'conversation'
  @hasMany 'messages'
  @hasOne 'scope'
  @persist Batman.RailsStorage

  @encode 'last_read'

