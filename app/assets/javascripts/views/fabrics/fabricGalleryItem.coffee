class App.Views.FabricGalleryItem extends Backbone.View
  template: JST['fabrics/galleryItem']

  className: "galleryItem"

  initialize: ->
    @model = @options.model

  render: ->
    @$el.html(@template(fabric: @model))
