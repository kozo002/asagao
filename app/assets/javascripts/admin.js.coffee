#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require jquery.autosize
#= require jquery_nested_form
#= require chosen-jquery
#= require_tree .

jQuery ($) ->
  $('textarea.autosize').autosize()
  $('select.chosen').chosen()

  $('#fields-for-categories').on 'nested:fieldAdded', (e) ->
    e.field.find('select.chosen').chosen()
