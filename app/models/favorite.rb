# Got this code from
# http://doblock.com/articles/creating-an-extensible-user-favorites-system-in-rails

class Favorite < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  # attr_accessible :title, :body
  attr_accessible :user_id, :product_id
  validates_uniqueness_of :product_id

end
