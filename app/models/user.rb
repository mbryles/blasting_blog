class User < ActiveRecord::Base
  attr_accessible :email, :is_admin, :name
  has_many :posts, :dependent => :destroy
end
