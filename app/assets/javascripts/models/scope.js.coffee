class Sgap.Scope extends Batman.Model
  @storageKey: 'scopes'
  @persist Batman.RailsStorage
  @belongsTo 'conversation'

  @encode 'name', 'type'
