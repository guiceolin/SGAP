SGAP.Views.Enrollments ||= {}

class SGAP.Views.Enrollments.IndexView extends Backbone.View
  template: JST["backbone/templates/enrollments/index"]

  constructor: (options) ->
    super(options)
    @students = new SGAP.Collections.StudentsCollection()
    @enrollments = options.crowd.enrollments
    @enrollments.on('add', @addOne)
    @crowd = options.crowd

  save: (selectedStudent) ->
    newEnrollment = new @enrollments.model()
    newEnrollment.set('crowd_id', @crowd.get('id'))
    newEnrollment.set('student_id', selectedStudent.get('id'))
    @enrollments.create(newEnrollment.toJSON())

  render: =>
    $(@el).html(@template())
    @students.fetch
      success: =>
        $('#student_name').autocomplete
          source: @students.pluck('name')
          select: (event,ui) =>
            @save(@students.where({ name: ui.item.value })[0])
        @addAll()
    return this

  addAll: () =>
    @$("tbody").html('')
    @enrollments.each(@addOne)

  addOne: (enrollment) =>
    view = new SGAP.Views.Enrollments.EnrollmentView({model: enrollment, collection: @students})
    @$("tbody").append(view.render().el)
