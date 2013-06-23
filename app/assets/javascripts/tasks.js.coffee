# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('a.pause').bind 'click', () ->
  $(document).find('.mark').removeClass('mark')
  $(this).addClass('mark')

  $('.hidden-form').slideDown()
  
$('.link_create_interruption').bind 'click', () ->
  taskId = $('.mark').parent().data('task-id')
  name = $('.name-input').val()
  description = $('.description-input').val()
  interruptionUrl = "/tasks/#{taskId}/interruptions"
  $.ajax
    url: interruptionUrl
    type: 'POST'
    dataType: 'json'
    data: { interruption: { name: name, description: description } }
    success: ()-> 
     $('.hidden-form').slideUp()
    error:  ()-> 
      alert(":-(")
