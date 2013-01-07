class App.Views.TagsGallery extends Backbone.View

  template: JST['fabrics/index']

  el: "#container"

  initialize: (options) ->
    @tag = options.tag
    console.log "view", @tag
    @fabrics = options.collection
    @fabrics.on 'reset', @render
    @fabrics.fetch()

  render: =>
    @$el.empty()
    @fabrics.each (fabric) ->
      view = new App.Views.FabricGalleryItem(model: fabric.toJSON())
      $('#container').append(view.render())
    $('a[rel*=facebox]').facebox()

