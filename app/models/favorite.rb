class Favorite < ActiveRecord::Base
  belongs_to :user
  has_one :product

  attr_accessible :user_id, :product_id
  validates_uniqueness_of :product_id, :scope => :user_id
end
