//= require jquery

$.fn.jsClick = (fn) ->
  @.click (event, args...) ->
    fn.call($(@), event, args)
    false

Joe = {}

Joe.initialize = (selector, initializer) ->
  elements = $(selector)
  if elements.length
    initializer.call(elements, elements)

Joe.initialize '.focus', -> @focus()

Joe.initialize '#result img', ->
  @jsClick ->
    $('input[type=submit]').click()
