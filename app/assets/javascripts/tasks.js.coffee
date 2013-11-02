# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.dropdown-toggle').dropdown()

$('.state').on 'click','a.pause', () ->
  $(document).find('.mark').removeClass('mark')
  $(this).parent().parent().parent().addClass('mark')
  $(this).parent().parent().css( "background-color": "#FF9900")
  
$('#NewInterruptionModal .link_create_interruption').bind 'click', (e) ->
  e.preventDefault()
  taskURL = $($('.mark').find('a')[0]).attr('href')
  name = $('.name-input').val()
  description = $('.description-input').val()
  interruptionUrl = "#{taskURL}/interruptions"
  $.ajax
    url: interruptionUrl
    type: 'POST'
    dataType: 'json'
    data: { interruption: { name: name, description: description, start_time: new Date } }
    success: ()->
      $('.mark a.resume').show()
      $('.mark a.pause').hide()
      $('#NewInterruptionModal .close.cabe').click()
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
      thisClicked.parent().parent().find('a.pause').show()
      thisClicked.parent().parent().find('a.resume').hide()
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
      thisClicked2.hide()
      thisClicked2.parent().find('.pause').show()
      thisClicked2.parent().find('.finish').show()
      thisClicked2.parent().parent().css( "background-color": "#33FF33")
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
      thisClicked3.parent().parent().css( "background-color": "#FF3300")
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
       
$('.calendar').on 'click', 'a.next, a.previous', (e)->
  e.preventDefault()
  $('.calendar').load("/reload_month?month=#{$(this).data('month')}")
 

