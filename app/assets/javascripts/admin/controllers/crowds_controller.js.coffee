Admin.CrowdsController = Ember.ArrayController.extend(
  loadAll: ->
    @set('content', Admin.Crowd.find())
  init: ->
    do @loadAll
)
