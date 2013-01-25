class App.Views.Tagger extends Backbone.View

  template: JST['admin/tagger']

  id: "tagger"

  events:
    "click .start": "start"

  initialize: (options) ->
    @tag = ""
    @fabrics = options.collection
    @eventTracker = App.get('eventTracker')
    @eventTracker.on "modelClicked", @tagFabric, @

  render: =>
    @$el.html(@template())
    $("#wrapper").append(@$el)

  start: =>
    @tag = @.$("input").val()

  tagFabric: (model) ->
    current_tags = model.get('tag_list')
    unless current_tags.indexOf(@tag) > -1
      new_tags = current_tags + "," + @tag
      model.set(tag_list: new_tags)
      model.save()