# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$ ->
  bigStar = $("#nav-fav-star")
  favIt = $(".fav-it")
  unFavIt = $(".un-fav-it")
  $(".favorite").draggable()

  favIt.live "click", ->
    bigStar.css
      color: "#EEEABB"
    $(@).find('form').submit()

  unFavIt.live "click", ->
    $(@).find('form').submit()
    bigStar.css
      color: "#0E3850;"



  $(".fav-it").live "ajax:success", ->
    $(@).parents('.product').addClass('favorited')

  $(".un-fav-it").live "ajax:success", ->
    $(@).parents('.product').removeClass('favorited')