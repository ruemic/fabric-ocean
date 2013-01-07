class App.Router extends Backbone.Router
  routes:
    ''           : 'index'
    'favorites'  : 'favorites'
    'tag/:tag'   : 'tag'


  initialize: ->
    window.fabrics = new App.Collections.Fabrics()
    window.favorites = new App.Collections.Favorites()
    window.tag = new App.Collections.Tag(tag: "floral")

    @favorites = window.favorites
    @fabrics = window.fabrics
    @tag = window.tag

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
    @tag.tag = tag
    @tag.fetch
      success: ->
        view = new App.Views.TagsGallery(collection: @tag, tag: tag)