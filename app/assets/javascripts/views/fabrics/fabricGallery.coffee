class App.Views.FabricGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  render: =>
    @collection.each (fabric ) ->
      view = new App.Views.FabricGalleryItem(model: fabric.toJSON())
      $("#container").append(view.render())
    $('a[rel*=facebox]').facebox()

