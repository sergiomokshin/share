class User < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :posts
  has_many :comments
  has_many :links
  has_many :atachments

end