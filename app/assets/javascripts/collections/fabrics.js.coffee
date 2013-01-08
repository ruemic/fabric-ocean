class App.Collections.Fabrics extends Backbone.Collection
  model: App.Models.Fabric
  url: 'api/products'


class App.Collections.Favorites extends App.Collections.Fabrics
  url: 'api/favorites'

class App.Collections.TaggedWith extends App.Collections.Fabrics

  initialize: (options) ->
    @tag = null


  url: ->
   "/api/tags/" + @tag


