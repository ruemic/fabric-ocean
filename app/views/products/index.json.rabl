collection @products

attributes :id, :name, :image_url

node(:image_url) { |product| product.image_url(:thumb) }