class SGAP.Models.Enrollment extends Backbone.Model
  paramRoot: 'enrollment'

  defaults:
    crowd_id: null
    student_id: null

class SGAP.Collections.EnrollmentsCollection extends Backbone.Collection
  model: SGAP.Models.Enrollment
  url: '/enrollments'
