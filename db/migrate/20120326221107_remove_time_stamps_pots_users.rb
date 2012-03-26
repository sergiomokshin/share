class RemoveTimeStampsPotsUsers < ActiveRecord::Migration
  def up
  	remove_column :posts_users, :created_at
  	remove_column :posts_users, :updated_at
  end

  def down
  end
end
