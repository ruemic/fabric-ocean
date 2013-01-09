class App.Views.AdminGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @fabrics = @collection

  render: =>
    @$el.empty()
    @fabrics.each (fabric) ->
      view = new App.Views.FabricGalleryItem(model: fabric)
      $("#container").append(view.render())

    tagger = new App.Views.Tagger(collection: @fabrics)
    tagger.render()
