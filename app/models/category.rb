class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of  :title

  def image
    image = nil
    catch :done do 
      self.products.each do |product|
        product.inventories.each do |inventory|
          if inventory.image.url
            image = inventory.image.url
            throw :done
          end
        end
      end
    end
    
    return image
  end
end
