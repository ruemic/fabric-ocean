class Gallery.Routers.Fabrics extends Backbone.Router
  routes:
    '': 'index'
    'fabrics/:id': 'show'

  index: ->
    view = new Gallery.Views.FabricsIndex()
    $("#container").html(view.render().el)

  show: (id) ->
    alert "fabric #{id}"