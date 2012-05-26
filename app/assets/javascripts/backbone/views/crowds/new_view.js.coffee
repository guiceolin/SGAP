SGAP.Views.Crowds ||= {}

class SGAP.Views.Crowds.NewView extends Backbone.View
  template: JST["backbone/templates/crowds/new"]

  events:
    "submit #new-crowd": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (crowd) =>
        @model = crowd
        window.location.hash = "/#{@model.id}"

      error: (crowd, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
