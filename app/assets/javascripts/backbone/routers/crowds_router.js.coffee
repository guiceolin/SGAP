class SGAP.Routers.CrowdsRouter extends Backbone.Router
  initialize: (options) ->
    @crowds = new SGAP.Collections.CrowdsCollection()
    @enrollments = new SGAP.Collections.EnrollmentsCollection()
    @crowds.reset options.crowds

  routes:
    "new"      : "newCrowd"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newCrowd: ->
    @view = new SGAP.Views.Crowds.NewView(collection: @crowds)
    $("#crowds").html(@view.render().el)

  index: ->
    @view = new SGAP.Views.Crowds.IndexView(crowds: @crowds)
    $("#crowds").html(@view.render().el)

  show: (id) ->
    crowd = @crowds.get(id)
    @enrollments.url = '/crowds/' + id + '/enrollments/'

    @view = new SGAP.Views.Crowds.ShowView(model: crowd, enrollments: @enrollments)
    $("#crowds").html(@view.render().el)

  edit: (id) ->
    crowd = @crowds.get(id)

    @view = new SGAP.Views.Crowds.EditView(model: crowd)
    $("#crowds").html(@view.render().el)
