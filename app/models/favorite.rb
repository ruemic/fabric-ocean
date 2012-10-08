# Got this code from
# http://doblock.com/articles/creating-an-extensible-user-favorites-system-in-rails

class Favorite < ActiveRecord::Base
  belongs_to :favorable
  belongs_to :user
  # attr_accessible :title, :body
  validates_presence_of :user_id, :favorable_id, :favorable_type

  before_save :associate_user

  protected
  def associate_user
    unless self.user_id
      return self.user_id = session[:user_id] if session[:user_id]
      return false
    end
  end

end