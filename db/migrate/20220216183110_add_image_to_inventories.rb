class AddImageToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :image, :text
  end
end
