class Sgap.Message extends Batman.Model
  @storageKey: 'messages'
  @resourceName: 'message'
  @persist Batman.RailsStorage
  @belongsTo 'user'
  @belongsTo 'conversation'

  @encode 'body'
