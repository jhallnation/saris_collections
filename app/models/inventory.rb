class Inventory < ApplicationRecord
  belongs_to :product

  validates_presence_of  :color, :size, :quantity, :price

  monetize :price_cents

  mount_uploader :image, InventoryUploader
end
