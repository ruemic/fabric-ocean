class App.Views.FabricGalleryItem extends Backbone.View
  template: JST['fabrics/galleryItem']

  className: "galleryItem"

  events:
    'click' : "onFabricClick"

  initialize: ->
    @model = @options.model
    @model.on("change:tag_list", @updateTags, @)
    @eventTracker = App.get('eventTracker')

  render: ->
    @$el.html(@template(fabric: @model.toJSON()))

  updateTags: ->
    @.$('.tagged-with span').html(@model.get('tag_list'))

  onFabricClick: ->
    console.log "event tracker"
    @eventTracker.triggerModelClicked(@model)

