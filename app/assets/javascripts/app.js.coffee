window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new App.Router()
    Backbone.history.start()

$(document).ready ->
  App.init()
