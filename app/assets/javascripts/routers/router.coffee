class App.Router extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    window.fabrics = new App.Collections.Fabrics()
    @fabrics = window.fabrics

  index: ->
    @fabrics.fetch
      success: ->
        view = new App.Views.FabricGallery(collection: @fabrics)
        view.render()

