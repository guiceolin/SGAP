SGAP.Views.Crowds ||= {}

class SGAP.Views.Crowds.ShowView extends Backbone.View
  template: JST["backbone/templates/crowds/show"]

  initialize: () ->

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @model.enrollments.fetch
      success: =>
        enrollmentsView = new SGAP.Views.Enrollments.IndexView({crowd: @model})
        @$("#enrollments").html(enrollmentsView.render().el)
    return this
