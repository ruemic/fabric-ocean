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
    if current_tags.indexOf(@tag) > -1
      console.log "already contains", @tag
    else
      current_tags.push @tag
      console.log "w new tag", current_tags
      #TODO should update UI on save
      model.save()