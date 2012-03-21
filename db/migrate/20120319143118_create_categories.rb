class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description
      t.string :color
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
