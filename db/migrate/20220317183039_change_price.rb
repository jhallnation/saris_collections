class ChangePrice < ActiveRecord::Migration[7.0]
  def change
    add_monetize :inventories, :price, currency: { present: true }
  end
end
