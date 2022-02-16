class AddPriceToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :price, :decimal
  end
end
