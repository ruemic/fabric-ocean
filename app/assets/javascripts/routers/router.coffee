class App.Router extends Backbone.Router
  routes:
    ''           : 'index'
    'favorites'  : 'favorites'
    'tag/:tag'   : 'tag'


  initialize: ->
    window.fabrics = new App.Collections.Fabrics()
    window.favorites = new App.Collections.Favorites()
    window.taggedWith = new App.Collections.TaggedWith(tag: "floral")

    @favorites = window.favorites
    @fabrics = window.fabrics
    @taggedWith = window.taggedWith

  index: ->
    @fabrics.fetch
      success: ->
        view = new App.Views.FabricGallery(collection: @fabrics, favorites: @favorites)
        view.render()

  favorites: ->
    @fabrics.fetch
      success: ->
        view = new App.Views.FavoritesGallery(collection: @fabrics, favorites: @favorites)

  tag: (tag) ->
    @taggedWith.tag = tag
    @taggedWith.fetch
      success: ->
        view = new App.Views.TagsGallery(collection: @taggedWith, tag: tag)