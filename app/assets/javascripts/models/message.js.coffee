class Sgap.Message extends Batman.Model
  @storageKey: 'messages'
  @persist Batman.RailsStorage
  @belongsTo 'user'

  @encode 'body'
