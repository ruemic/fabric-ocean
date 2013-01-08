class App.Models.Fabric extends Backbone.Model

  addTag: (tag) ->
    @.attributes.tag_list.push(tag)
    @.save()

  removeTag: (tag) ->
    @.attributes.tag_list.splice(tag)
    @.save()