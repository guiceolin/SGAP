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


