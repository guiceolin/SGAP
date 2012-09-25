class Sgap.Subject extends Batman.Model
  @storageKey: 'subjects'
  @resourceName: 'subject'
  @hasMany 'conversations', { as: 'scope'}
  @hasMany 'crowds'
  @persist Batman.RailsStorage

  @encode 'name', 'id'
