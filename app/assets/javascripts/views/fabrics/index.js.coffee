class Gallery.Views.FabricsIndex extends Backbone.View

  template: JST['fabrics/index']

  render: ->
    $(@el).html(@template())
    this