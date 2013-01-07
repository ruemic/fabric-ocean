class App.Collections.Fabrics extends Backbone.Collection

  url: 'api/products'




  model: App.Models.Fabric


class App.Collections.Favorites extends Backbone.Collection

  url: 'api/favorites'

  model: App.Models.Fabric

class App.Collections.Tag extends Backbone.Collection

  initialize: (options) ->
    @tag = options.tag

  url: ->
   "/api/tags/" + @tag

  model: App.Models.Fabric

