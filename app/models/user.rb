class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :products, :through => :favorites
  has_many :favorites, :dependent => :destroy

  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

end