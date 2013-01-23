class App.Views.TagsGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @tag = options.tag
    @fabrics = options.collection
    @fabrics.on 'reset', @render
    @fabrics.on( 'add', @addOne, @)
    @fabrics.fetch()

  render: =>
    @$el.empty()
    @fabrics.each( @addOne.bind(@) )

  addOne: (fabric) ->
    view = new App.Views.FabricGalleryItem(model: fabric)
    $('#container').append(view.render())

