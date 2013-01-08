class App.Views.FabricGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @fabrics = @collection

  render: =>
    @$el.empty()
    @collection.each (fabric) ->
      view = new App.Views.FabricGalleryItem(model: fabric)
      $("#container").append(view.render())
    $('a[rel*=facebox]').facebox()
