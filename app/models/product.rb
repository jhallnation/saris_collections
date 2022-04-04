class Product < ApplicationRecord
  belongs_to :category
  has_many :inventories, dependent: :destroy

  enum status: {draft: 0, published: 1}

  has_rich_text :description
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of  :title, :category_id

end
