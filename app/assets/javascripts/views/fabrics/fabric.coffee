class Gallery.Views.Fabric extends Backbone.View
  template: JST['fabrics/fabric']

  className: "product"

  initialize: ->
    @model = @options.model

  render: ->
    @makeThumbnailURl
    @$el.html(@template(fabric: @model))
