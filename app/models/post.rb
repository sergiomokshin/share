#encoding: utf-8

class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	has_many :links, :dependent => :destroy
	has_many :attachments, :dependent => :destroy
	belongs_to :category
	belongs_to :user
	has_and_belongs_to_many :users

	validates_presence_of :subject
	validates_presence_of :body
	validates_presence_of :category_id
	validates_presence_of :user_id
end
