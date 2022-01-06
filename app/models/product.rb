class Product < ApplicationRecord
  belongs_to :category
  has_many :inventories

  validates_presence_of  :title, :price, :category_id
end
