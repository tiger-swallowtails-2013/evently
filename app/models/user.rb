
class User < ActiveRecord::Base
  has_many :events
  validates_presence_of :email, :password
  validates_uniqueness_of :email
end