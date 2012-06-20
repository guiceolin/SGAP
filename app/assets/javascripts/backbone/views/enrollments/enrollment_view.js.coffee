SGAP.Views.Enrollments ||= {}

class SGAP.Views.Enrollments.EnrollmentView extends Backbone.View
  template: JST["backbone/templates/enrollments/enrollment"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    @model.student = @collection.get(@model.attributes.student_id)
    view = new SGAP.Views.Students.StudentView(model: @model.student)
    @$('.name').html(view.render())
    return this


