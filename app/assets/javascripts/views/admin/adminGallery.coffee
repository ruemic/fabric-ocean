class App.Views.AdminGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @fabrics = @collection

  render: =>
    @$el.empty()
    @fabrics.each (fabric) ->
      view = new App.Views.AdminGalleryItem(model: fabric)
      $("#container").append(view.render())

    taggerModel = new App.Models.Tagger()
    taggerView = new App.Views.Tagger(collection: @fabrics, model: taggerModel)
    taggerView.render()
