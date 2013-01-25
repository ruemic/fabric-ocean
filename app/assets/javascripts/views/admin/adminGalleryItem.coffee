class App.Views.AdminGalleryItem extends Backbone.View
  template: JST['admin/adminGalleryItem']

  className: "galleryItem"

  events:
    "click" : "onFabricClick"
    "change input": "editTags"

  initialize: ->
    @model = @options.model
    @eventTracker = App.get('eventTracker')
    @model.on("change:tag_list", @updateTags, @)

  editTags: =>
    @model.set tag_list: @.$("input").val()
    @model.save()

  render: ->
    @$el.html(@template(fabric: @model.toJSON()))

  updateTags: ->
    @.$("input").addClass("saved")
    setTimeout( @transparentizeBorder, 300)

  transparentizeBorder: ->
    @.$("input").removeClass('saved')

  onFabricClick: ->
    console.log "event tracker"
    @eventTracker.triggerModelClicked(@model)

