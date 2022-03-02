module ProductsHelper

def image_generator(height:, width:)
  "https://place-hold.it/#{height}x#{width}"
  end

  def check_image img
    if !img.nil?
      img
    else    
      image_generator(height: '350', width: '200')
    end
  end
end
