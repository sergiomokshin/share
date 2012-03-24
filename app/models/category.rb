class Category < ActiveRecord::Base
	has_many :posts, :dependent => :destroy
	
	validates_presence_of :description
end
