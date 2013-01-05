class App.Router extends Backbone.Router
  routes:
    ''            : 'index'
    ':favorites'  : 'favorites'

  initialize: ->
    window.fabrics = new App.Collections.Fabrics()
    window.favorites = new App.Collections.Favorites()
    @favorites = window.favorites
    @fabrics = window.fabrics

  index: ->
    @fabrics.fetch
      success: ->
        view = new App.Views.FabricGallery(collection: @fabrics, favorites: @favorites)
        view.render()

  favorites: ->
    @fabrics.fetch
      success: ->
        view = new App.Views.FavoritesGallery(collection: @fabrics, favorites: @favorites)
