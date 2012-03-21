class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :description
      t.string :path
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
