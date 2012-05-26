SGAP.Views.Enrollments ||= {}

class SGAP.Views.Enrollments.EnrollmentView extends Backbone.View
  template: JST["backbone/templates/enrollments/enrollment"]

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    return this
