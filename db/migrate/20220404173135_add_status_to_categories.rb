class AddStatusToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :status, :integer, default: 0
  end
end
