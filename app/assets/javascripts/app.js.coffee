window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    @configureApp()
    new App.Router()
    Backbone.history.start()

  configureApp: ->
    @eventTracker = new App.Models.EventTracker()

  get: (name) ->
    @[name]

$(document).ready ->
  App.init()
