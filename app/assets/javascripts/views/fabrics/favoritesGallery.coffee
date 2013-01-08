class App.Views.FavoritesGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @fabrics = @collection
    @favorites = options.favorites
    @favorites.on 'reset', @render
    @favorites.fetch()
    @favorites.on('add', @addOne, @)

  render: =>
    $('a[rel*=facebox]').facebox()
    @favorites.each (favorite) ->
      id = favorite.get('product_id')
      fabric = @fabrics.get(id)
      #TODO add validation
      if fabric
        view = new App.Views.FabricGalleryItem(model: fabric)
        $('#container').append(view.render())
      else
        console.log "fabric is", fabric

  addOne: (fabric) ->
    view = new App.Views.FabricGalleryItem(model: fabric)
    $('#container').append(view.render())


