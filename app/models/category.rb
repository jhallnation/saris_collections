class Category < ApplicationRecord
  has_many :products

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of  :title
end
