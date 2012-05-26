SGAP.Views.Crowds ||= {}

class SGAP.Views.Crowds.EditView extends Backbone.View
  template : JST["backbone/templates/crowds/edit"]

  events :
    "submit #edit-crowd" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (crowd) =>
        @model = crowd
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
