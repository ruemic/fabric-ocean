class App.Router extends Backbone.Router
  routes:
    '': 'index'
    'fabrics/:id': 'show'

  initialize: ->
    window.fabrics = new App.Collections.Fabrics()
    @fabrics = window.fabrics

  index: ->
    @fabrics.fetch
      success: ->
        view = new App.Views.FabricGallery(collection: @fabrics)
        view.render()


  show: (id) ->
    alert "fabric #{id}"