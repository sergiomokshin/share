class Attachment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	
	validates_presence_of :path

	require 'carrierwave/orm/activerecord'
	mount_uploader :path, PathUploader
end
