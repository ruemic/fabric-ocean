class Gallery.Routers.Fabrics extends Backbone.Router
  routes:
    '': 'index'
    'fabrics/:id': 'show'

  initialize: ->
    window.fabrics = new Gallery.Collections.Fabrics()
    @fabrics = window.fabrics

  index: ->
    @fabrics.fetch
      success: ->
        view = new Gallery.Views.FabricsIndex(collection: @fabrics)
        view.render()


  show: (id) ->
    alert "fabric #{id}"