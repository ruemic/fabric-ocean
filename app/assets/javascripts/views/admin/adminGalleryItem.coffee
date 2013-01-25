class App.Views.AdminGalleryItem extends Backbone.View
  template: JST['admin/adminGalleryItem']

  className: "galleryItem"

  events:
    "click" : "onFabricClick"
    "change input": "addTags"

  initialize: ->
    @model = @options.model
    @model.on("change:tag_list", @updateTags, @)
    @eventTracker = App.get('eventTracker')

  addTags: =>
    newTag = @.$("input").val()
    @model.addTag(newTag)

  render: ->
    @$el.html(@template(fabric: @model.toJSON()))

  updateTags: ->
    @.$('.tagged-with span').html(@model.get('tag_list'))

  onFabricClick: ->
    console.log "event tracker"
    @eventTracker.triggerModelClicked(@model)

