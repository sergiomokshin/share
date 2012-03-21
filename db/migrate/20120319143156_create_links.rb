class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :description
      t.string :url
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
