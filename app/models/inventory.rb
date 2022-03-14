class Inventory < ApplicationRecord
  belongs_to :product

  validates_presence_of  :color, :size, :quantity, :price

  mount_uploader :image, InventoryUploader
end
