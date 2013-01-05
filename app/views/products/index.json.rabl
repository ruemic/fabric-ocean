collection @products

attributes :id, :name, :image_url, :tag_list

node(:image_url) { |product| product.image_url(:thumb) }