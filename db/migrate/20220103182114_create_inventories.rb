class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end
