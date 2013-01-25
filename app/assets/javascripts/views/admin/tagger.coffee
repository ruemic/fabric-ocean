class App.Views.Tagger extends Backbone.View

  template: JST['admin/tagger']

  id: "tagger"

  events:
    "click .start"  : "start"
    "click .stop"   : "stop"

  initialize: (options) ->
    @model = options.model
    # @.listenTo(@model, "change:active", @toggleState)

  render: =>
    @$el.html(@template())
    $("#wrapper").append(@$el)

  start: =>
    @model.set(active: true)
    @model.set(tag: @.$("input").val())
    console.log @model.get('tag')

  stop: =>
    console.log "stop"
    @model.set(active: false)

  toggleState: ->
    if @model.get('active') is true
      console.log "active"
    else
      console.log "not active"
