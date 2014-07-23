#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require jquery.autosize
#= require_tree .

jQuery ($) ->
  $('textarea.autosize').autosize()
