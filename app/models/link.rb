class Link < ActiveRecord::Base
	belongs_to :post	
	belongs_to :user

	validates_presence_of :url
end
