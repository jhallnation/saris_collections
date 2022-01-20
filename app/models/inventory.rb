class Inventory < ApplicationRecord
  belongs_to :product

  validates_presence_of  :color, :size, :quantity
end
