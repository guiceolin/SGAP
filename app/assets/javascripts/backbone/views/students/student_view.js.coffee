SGAP.Views.Students ||= {}

class SGAP.Views.Students.StudentView extends Backbone.View
  template: JST["backbone/templates/students/student"]

  tagName: "span"

  render: =>
    $(@el).html(@template(@model.toJSON() ))
