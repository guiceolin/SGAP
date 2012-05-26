class SGAP.Models.Crowd extends Backbone.Model
  paramRoot: 'crowd'

  initialize: ->
    @enrollments = new SGAP.Collections.EnrollmentsCollection
    @enrollments.url = '/crowds/' + @id + '/enrollments/'


  defaults:
    id: null
    name: null
    semester: null
    year: null
    professor_id: null
    subject_id: null

class SGAP.Collections.CrowdsCollection extends Backbone.Collection
  model: SGAP.Models.Crowd
  url: '/crowds'
