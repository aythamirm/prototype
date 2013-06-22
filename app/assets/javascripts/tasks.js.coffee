# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('a.pause').bind 'click', () ->
  $('.hidden-form').show()
  
  $(this).addClass('marca')

$('.link_create_interruption').bind 'click', () ->
  taskId = $('.marca').parent().data('task-id')
  name = $('.name-input').val()
  description = $('.description-input').val()
  interruptionUrl = "/tasks/#{taskId}/interruptions"
  $.ajax
    url: interruptionUrl
    type: 'POST'
    dataType: 'json'
    data: { interruption: { name: name, description: description } }
    success: ()-> 
      alert(":-)")
    error:  ()-> 
      alert(":-(")
