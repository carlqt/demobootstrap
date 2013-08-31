module PagesHelper
  
  def logo(image)
    image = image + ".jpg"
    
    image_tag(image, :alt => "bakeshop logo", :class => "round")
  end
  
  
end
