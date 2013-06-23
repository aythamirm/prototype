# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.content').on 'click','a.pause', () ->
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
    data: { interruption: { name: name, description: description, start_time: new Date } }
    success: ()-> 
     $('.hidden-form').slideUp()
     $('.mark').removeClass('pause').addClass('resume')
     $('.mark').html('resume')
    error:  ()-> 
      alert(":-(")
$('.content').on 'click', '.resume', ()-> 
  taskID = $(this).parent().data('task-id')
  resumeUrl = "/tasks/#{taskID}/interruptions_stop"
  $.ajax
    url: resumeUrl
    type: 'GET'
    dataType: 'json'
    success:()->
      alert(":-)")
    error:()->  
      alert(":-(")