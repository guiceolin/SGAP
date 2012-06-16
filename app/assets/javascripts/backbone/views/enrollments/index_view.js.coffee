SGAP.Views.Enrollments ||= {}

class SGAP.Views.Enrollments.IndexView extends Backbone.View
  template: JST["backbone/templates/enrollments/index"]

  render: ->
    $(@el).html(@template())
    @addAll()
    return this

  addAll: () =>
    @$("tbody").html('')
    @options.enrollments.each(@addOne)

  addOne: (enrollment) =>
    view = new SGAP.Views.Enrollments.EnrollmentView({model: enrollment})
    @$("tbody").append(view.render().el)
