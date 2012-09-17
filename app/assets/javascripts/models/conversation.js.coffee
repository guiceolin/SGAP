class Sgap.Conversation extends Batman.Model
  @storageKey: 'conversations'
  @resourceName: 'conversation'
  @hasMany 'messages'
  @belongsTo 'scope', {polymorphic: true}
  @persist Batman.RailsStorage

