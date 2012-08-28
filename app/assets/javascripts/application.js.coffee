# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui-1.8.20.custom.min
#= require_tree .
$ ->
  $('#base-tr').hide()

  $('.goto').each (i,node) ->
    $(node).autocomplete
      source: "/#{$(node).data('resource')}/search/"
      minLenght: 2
      select: (event,ui) ->
        window.location.href = "/#{$(node).data('resource')}/#{ui.item.value}"

  $('#student-add').autocomplete
    source: '/admin/students/'
    minLength: 2
    select: (event, ui) ->
      crowd_id = $(location).attr('href').split('/').pop()
      enrollment = new Enrollment
      enrollment.create crowd_id, ui.item.id.toString(), (elem) ->
         tr = $('#base-tr').clone()
         $(tr).html('<td>' + elem.student.name + '</td> ').fadeIn()
         $('#students-table').append(tr)

  $("form.search input").keyup ->
    form = $("form.search")
    $.ajax(
      url: form.attr("action")
      data: form.serialize()
    ).done (data) ->
      $("table tbody").html data

  $("form.search select").change ->
    form = $("form.search")
    $.ajax(
      url: form.attr("action")
      data: form.serialize()
    ).done (data) ->
      $("table tbody").html data

class Enrollment
  constructor: (@resourceLocation,@student) ->

  create: (crowd_id, student_id, callback = (self)-> ) ->
    self = this
    $.ajax
      url: '/admin/enrollments/'
      dataType: 'json'
      type: 'POST'
      data:
        enrollment:
          crowd_id: crowd_id
          student_id: student_id
      complete: (xhr,status) ->
        self.resourceLocation = xhr.getResponseHeader('Location')
        self.get(callback)

  get: (callback = ->) ->
    self = this
    $.ajax
      url: self.resourceLocation
      dataType: 'json'
      type: 'GET'
      complete: (xhr,status) ->
        self.student = JSON.parse(xhr.responseText).student
        callback(self)

class DataManager

class DataManager.Base
  constructor: (@fields = {}) ->
  field: (name, value = null) ->
    @fields[name] ||= value
  save: (callback = null) ->
    objToSave = {}
    for fieldName, fieldValue of @fields
      objToSave[fieldName] = fieldValue
    console.log objToSave
    source = @getSource()
    data = {}
    data[@resource] = objToSave
    $.ajax
      url: source
      dataType: 'json'
      type: 'POST'
      async: false
      data: data
      complete: (xhr,status) =>
        @location = xhr.getResponseHeader('Location')
        if callback != null
          callback(this)
    return true
  getSource: ->
    if typeof(@source) == 'function' then @source.call() else @source

class Membership extends DataManager.Base
  constructor: (attr) ->
    super(attr)
    @resource = 'membership'
    @source = => return "/professor/crowds/#{@fields.group.crowd_id}/groups/#{@fields['group_id']}/memberships/"
    @field 'student_id'
    @field 'group_id'

class Student extends DataManager.Base
  constructor: (attr) ->
    @source = '/admin/students/'
    super(attr)
    @field 'id'

class Group extends DataManager.Base
  constructor: (attr) ->
    super(attr)
    @source = => return "/professor/crowds/#{@fields['crowd_id']}/groups/"

class Autocompleter
  constructor: (@placeholder, @resource, @minLenght = 2) ->
    @field = @placeholder.autocomplete
      source: @resource.getSource()
      minLenght: @minLenght
      select: @select

  @select: (event, ui) ->
  @show: (elem) ->

class MembershipAutocompleter extends Autocompleter
  constructor: (@placeholder, @minLenght = 2) ->
    @resource = new Student
    super(@placeholder, @resource, @minLenght)
  show: (elem) ->
    tr = $('#base-tr').clone()
    $(tr).html('<td>' + elem.fields.student.name + "</td><td><a href='#{elem.location}' data-method='delete' data-confirm='Tem Certeza?' rel='nofollow' ><i class='icon-remove' /></a></td> ").fadeIn()
    $('#students-table').append(tr)
    @placeholder.val('')

  select: (event, ui) =>
    student = new Student(ui.item)
    newMembership = new Membership({student: student.fields, group: currentGroup.fields, group_id: window.currentGroup.fields.id, student_id: student.fields.id})
    newMembership.save @show

window.Membership = Membership
window.Student = Student
window.Group = Group
window.MembershipAutocompleter = MembershipAutocompleter
window.DataManager = DataManager
