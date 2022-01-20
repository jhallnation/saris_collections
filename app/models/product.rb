class Product < ApplicationRecord
  belongs_to :category
  has_many :inventories, dependent: :destroy
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of  :title, :price, :category_id
end
