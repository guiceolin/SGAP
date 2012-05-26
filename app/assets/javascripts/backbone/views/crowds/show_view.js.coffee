SGAP.Views.Crowds ||= {}

class SGAP.Views.Crowds.ShowView extends Backbone.View
  template: JST["backbone/templates/crowds/show"]

  initialize: () ->
    @options.enrollments.on('reset', @addAll)
    @options.enrollments.fetch()

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @addAll()
    return this

  addAll: () =>
    @options.enrollments.each(@addOne)

  addOne: (enrollment) =>
    view = new SGAP.Views.Enrollments.EnrollmentView({model: enrollment})
    @$("#enrollments").append(view.render().el)
