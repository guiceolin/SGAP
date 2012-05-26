SGAP.Views.Crowds ||= {}

class SGAP.Views.Crowds.IndexView extends Backbone.View
  template: JST["backbone/templates/crowds/index"]

  initialize: () ->
    @options.crowds.bind('reset', @addAll)

  addAll: () =>
    @options.crowds.each(@addOne)

  addOne: (crowd) =>
    view = new SGAP.Views.Crowds.CrowdView({model : crowd})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(crowds: @options.crowds.toJSON() ))
    @addAll()

    return this
