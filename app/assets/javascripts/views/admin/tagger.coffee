class App.Views.Tagger extends Backbone.View

  template: JST['admin/tagger']

  id: "tagger"

  events:
    "click .start"  : "start"
    "click .stop"   : "stop"

  initialize: (options) ->
    @model = options.model
    @.listenTo(@model, "change:active", @toggleActiveState)

  render: =>
    @$el.html(@template())
    $("#wrapper").append(@$el)

  start: =>
    new_tag = @.$("input").val()
    unless new_tag is ""
      @model.set(active: true)
      @model.set(tag: new_tag)

  stop: =>
    @model.set(active: false)

  toggleActiveState: ->
    if @model.get('active') is true
      @$el.addClass("active")
    else
      @$el.removeClass("active")
