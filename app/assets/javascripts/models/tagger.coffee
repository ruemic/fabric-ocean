class App.Models.Tagger extends Backbone.Model

  defaults:
    tag: ""
    active: false

  initialize: ->
    console.log "tagger model"
    @eventTracker = App.get('eventTracker')
    @eventTracker.on "modelClicked", @tagFabric, @

  tagFabric: (model) ->
    if @.get('active') is true
      new_tag = @.get('tag')
      current_tags = model.get('tag_list')
      unless current_tags.indexOf(new_tag) > -1
        if current_tags.length > 0
          new_tags = current_tags + "," + new_tag
          model.set(tag_list: new_tags)
          model.save()
        else
          model.set(tag_list: new_tag)
          model.save()