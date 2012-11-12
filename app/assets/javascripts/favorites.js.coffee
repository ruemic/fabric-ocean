# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$ ->
  $(".favorite").draggable()


  $("#drag-hint").delay(4000).fadeOut('slow')

  bigStar = $("#nav-fav-star")
  favIt = $(".fav-it")
  unFavIt = $(".un-fav-it")
  destroy = $(".destroy")

  favIt.live "click", ->
    bigStar.css
      color: "#EEEABB"
    $(@).find('form').submit()

  unFavIt.live "click", ->
    $(@).find('form').submit()
    bigStar.css
      color: "#0E3850;"

  destroy.live "click", ->
    $(@).parents('form').submit()

  $(".favorite form").live "ajax:success", ->
    $(@).parents('.favorite').remove()



  favIt.live "ajax:success", ->
    $(@).parents('.product').addClass('favorited')

  unFavIt.live "ajax:success", ->
    $(@).parents('.product').removeClass('favorited')


