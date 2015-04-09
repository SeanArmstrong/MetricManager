isClassGraphsOpen = false;

$(document).on "click", "tr[data-link]", ->
  console.log("delegated button click!")
  window.location = this.attributes.getNamedItem('data-link').value

$(document).ready ->
  $('#classGraphs').collapse()
  return

$('#classGraphs').on 'hide.bs.collapse', ->
  alert('go')
  arrow = $('.fa-caret-up')
  arrow.removeClass('fa-caret-up')
  arrow.addClass('fa-caret-down')
  return

$('#classGraphs').on 'show.bs.collapse', ->
  arrow = $('.fa-caret-down')
  arrow.removeClass('fa-caret-down')
  arrow.addClass('fa-caret-up')
  return

$(document).on "click", $('#classGraphs'), (e)->
  console.log("Hello") 
  arrow = e.target.children[0]
  if isClassGraphsOpen == false 
    arrow.setAttribute('class', 'fa fa-caret-up')
    isClassGraphsOpen = true
  else
    arrow.setAttribute('class', 'fa fa-caret-down')
    isClassGraphsOpen = false
    


    
