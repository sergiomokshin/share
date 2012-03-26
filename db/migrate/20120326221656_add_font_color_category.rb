class AddFontColorCategory < ActiveRecord::Migration
  def up
  	add_column :categories, :font_color, :string
  end

  def down
  	remove_column :categories, :font_color
  end
end
