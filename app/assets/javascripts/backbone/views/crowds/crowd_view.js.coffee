SGAP.Views.Crowds ||= {}

class SGAP.Views.Crowds.CrowdView extends Backbone.View
  template: JST["backbone/templates/crowds/crowd"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
