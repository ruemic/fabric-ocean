class App.Views.FabricGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: ->
    console.log "init"
    _.bindAll "@, @render"

  render: ->
    @collection.each (fabric ) ->
      console.log "render", fabric
      view = new App.Views.FabricGalleryItem(model: fabric.toJSON())
      $("#container").append(view.render())

