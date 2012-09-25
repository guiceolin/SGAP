class Sgap.Group extends Batman.Model
  @storageKey: 'groups'
  @resourceName: 'group'
  @hasMany 'conversations', { as: 'scope' }
  @belongsTo 'crowd'
  @persist Batman.RailsStorage

  @encode 'name', 'id'
