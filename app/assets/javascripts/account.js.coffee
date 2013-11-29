# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.tabs .tab.panel .ui.step, .tabs .tab.content .move-steps .next').on 'click', (e) ->
    # console.log e.target
    if $(this).hasClass('next')
      index = $(this).closest('.segment').index()+1
    else 
      index = $(this).index()
    $(this).closest('.tabs').find('.tab.panel .ui.step').removeClass('active')
           .eq(index).addClass('active')
    segments = $(this).closest('.tabs').find('.tab.content .segment')
    segments.hide()
    segments.eq(index).show()