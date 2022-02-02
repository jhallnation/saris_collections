class Category < ApplicationRecord
  has_many :products

  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of  :title
end
