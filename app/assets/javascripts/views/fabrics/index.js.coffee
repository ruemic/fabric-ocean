class Gallery.Views.FabricsIndex extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: ->
    _.bindAll "@, @render"

  render: ->
    @collection.each (fabric ) ->
      view = new Gallery.Views.Fabric(model: fabric.toJSON())
      $("#container").append(view.render())

