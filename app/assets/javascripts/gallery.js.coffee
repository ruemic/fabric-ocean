window.Gallery =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Gallery.Routers.Fabrics()
    Backbone.history.start()

$(document).ready ->
  Gallery.init()
