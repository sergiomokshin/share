class AddPostAnduser < ActiveRecord::Migration
	def self.up
		create_table :posts_users, :id => false, :force => true do |t|
			t.integer :post_id
			t.integer :user_id		
			t.timestamps	
		end
	end
	def self.down
		drop_table :posts_users
	end
end