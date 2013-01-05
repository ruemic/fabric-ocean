class App.Collections.Tags extends Backbone.Collection

  url: '/api/products/floral'

  model: App.Models.Tag

window.tags = new App.Collections.Tags
