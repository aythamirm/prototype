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
     $('.mark').html('Resume')
    error:  ()-> 
      alert(":-(")

$('.content').on 'click', '.resume', ()-> 
  thisClicked = $(this)
  taskID = $(this).parent().data('task-id')
  resumeUrl = "/tasks/#{taskID}/interruptions_stop"
  $.ajax
    url: resumeUrl
    type: 'GET'
    dataType: 'json'
    data: {end_time: new Date}
    success:()->
      thisClicked.removeClass('resume').addClass('pause')
      thisClicked.html('Pause')
    error:()->  
      alert(":-(")

$('.content').on 'click', '.start', ()->
  thisClicked2 = $(this)
  taskID = $(this).parent().data('task-id')
  startUrl = "/tasks/#{taskID}/start_task"
  $.ajax
    url: startUrl
    type: 'GET'
    dataype:'json'
    success:()->
      thisClicked2.removeClass('start').addClass('pause')
      thisClicked2.html('Pause')
    error:()->  
      alert(":-(")