collection @all_products

attributes :id, :name, :image_url, :tag_list

node(:image_url_thumb) { |product| product.image_url(:thumb) }