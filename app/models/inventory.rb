class Inventory < ApplicationRecord
  belongs_to :product

  enum status: {draft: 0, published: 1}

  validates_presence_of  :color, :size, :quantity, :price

  monetize :price_cents

  mount_uploader :image, InventoryUploader
end
