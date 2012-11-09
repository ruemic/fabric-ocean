# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$ ->
  $(".favorite").draggable()

  $(".favorite-it").bind "ajax:success", ->
    $(@).find('.fav-star').addClass('favorited')