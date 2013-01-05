class App.Views.FavoritesGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @fabrics = @collection
    @favorites = options.favorites
    @favorites.on 'reset', @render
    @favorites.fetch()

  render: =>
    @favorites.each (favorite) ->
      id = favorite.get('product_id')
      fabric = @fabrics.get(id)
      view = new App.Views.FabricGalleryItem(model: fabric.toJSON())
      $('#container').append(view.render())
    $('a[rel*=facebox]').facebox()

