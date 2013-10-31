# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.dropdown-toggle').dropdown()

$('.state').on 'click','a.pause', () ->
  $('.state').find('.pause').parent().parent().find('.interruption_control').addClass('mark')
  $('.state').find('.pause').parent().parent().find('.interruption_control').slideDown()
  
$('.link_create_interruption').bind 'click', () ->
  taskURL = $('.mark').parent().parent().find('h4').find('a').attr('href')
  name = $('.name-input').val()
  description = $('.description-input').val()
  interruptionUrl = "#{taskURL}/interruptions"
  $.ajax
    url: interruptionUrl
    type: 'POST'
    dataType: 'json'
    data: { interruption: { name: name, description: description, start_time: new Date } }
    success: ()-> 
     $('.interruption_control').slideUp()
     $('.mark').removeClass('pause').addClass('resume')
     $('.mark').html('Resume')
     alert(":-)")
    error:  ()-> 
      alert(":-(")

$('.state').on 'click', 'a.resume', ()-> 
  thisClicked = $(this)
  taskURL = $(this).parent().parent().find('a').attr('href')
  resumeUrl = "#{taskURL}/interruptions_stop"
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

$('.state').on 'click', 'a.start', ()->
  thisClicked2 = $(this)
  taskURL = $(this).parent().parent().find('a').attr('href')
  startUrl = "#{taskURL}/start_task"
  $.ajax
    url: startUrl
    type: 'GET'
    dataType:'json'
    success:()->
      thisClicked2.removeClass('start').addClass('pause')
      thisClicked2.html('Pause')
      thisClicked2.parent().find('.finish').show()
    error:()->  
      alert(":-(")

$('.state').on 'click', 'a.finish', ()->
  thisClicked3 = $(this)
  taskURL = $(this).parent().parent().find('a').attr('href')
  finishUrl = "#{taskURL}/finish_task"
  $.ajax
    url: finishUrl
    type: 'GET'
    dataType:'json'
    success:()->
      thisClicked3.hide()
      thisClicked3.parent().find('.pause').hide()
      alert("task finished")
    error:()->  
      alert(":-(")

$('.link-show-description').bind 'click', () ->
  $(this).parent().find('.hidden-description').show()

$('.controls a').click (e)->
  e.preventDefault()
  parent = $(this).parent().parent().parent()
  $.ajax
    url: $(this).attr('href')
    type: 'GET'
    dataType: 'json'
    success:(action)->
      parent.remove();
      $(".badge.pull-right.#{action['old_action']}").html(parseInt($(".badge.pull-right.#{action['old_action']}").html()) - 1)
      $(".badge.pull-right.#{action['new_action']}").html(parseInt($(".badge.pull-right.#{action['new_action']}").html()) + 1)
    error:()->  
      alert(":-(")

$('.calendar ul li a').click (e)->
  e.preventDefault()
  parent = $(this).parent()
  $.ajax
    url: $(this).attr('href')
    type: 'GET'
    dataType: 'json'
    success:()->
      alert(":-)") 
      parent.remove();
    error:()->  
      alert(":-(")          