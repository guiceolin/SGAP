class Sgap.Crowd extends Batman.Model
  @storageKey: 'crowds'
  @resourceName: 'crowd'
  @hasMany 'conversations', { as: 'scope'}
  @belongsTo 'subject'
  @persist Batman.RailsStorage

  @encode 'name', 'id'
