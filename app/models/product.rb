class Product < ApplicationRecord
  belongs_to :category
  has_many :inventories, dependent: :destroy

  enum status: {draft: 0, published: 1}

  has_rich_text :description
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of  :title, :category_id

  def image
    image = nil
    catch :done do 
      self.inventories.each do |inventory|
        if inventory.image.url
          image = inventory.image.url
          throw :done
        end
      end
    end
    
    return image
  end

end
