class Product < ActiveRecord::Base
  attr_accessible :name, :image, :tag_list
  acts_as_taggable
  mount_uploader :image, ImageUploader

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
end
