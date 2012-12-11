class Gallery.Collections.Fabrics extends Backbone.Collection

  url: '/products'

  model: Gallery.Models.Fabric


window.collection = new Gallery.Collections.Fabrics()