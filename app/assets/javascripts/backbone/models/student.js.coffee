class SGAP.Models.Student extends Backbone.Model
  paramRoot: 'student'

  url: ->
    return '/students/'+ @id

  defaults:
    name: null

class SGAP.Collections.StudentsCollection extends Backbone.Collection
  model: SGAP.Models.Student
  url: '/students'
