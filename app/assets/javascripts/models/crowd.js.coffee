class Sgap.Crowd extends Batman.Model
  @storageKey: 'crowds'
  @resourceName: 'crowd'
  @hasMany 'conversations', { as: 'scope'}
  @persist Batman.RailsStorage

  @encode 'name', 'id'
